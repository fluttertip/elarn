import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';
import 'widgets/course_grid.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key, this.initialQuery = ''});

  final String initialQuery;

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = controller.text.trim();
    final courses = ref.watch(coursesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search courses')),
      body: courses.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (items) {
          final results = query.isEmpty ? items : items.where((course) {
            final haystack = '${course.title} ${course.description} ${course.categoryId} ${course.tags.join(' ')}'.toLowerCase();
            return haystack.contains(query.toLowerCase());
          }).toList();

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  hintText: 'Search by topic, skill, or course',
                ),
              ),
              const SizedBox(height: 16),
              CourseGrid(courses: results),
            ],
          );
        },
      ),
    );
  }
}
