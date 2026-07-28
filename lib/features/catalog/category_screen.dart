import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';
import 'widgets/course_grid.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(categoryId.toUpperCase())),
      body: courses.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (items) {
          final filtered = items.where((course) => course.categoryId == categoryId).toList();
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(categoryId, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 16),
              CourseGrid(courses: filtered),
            ],
          );
        },
      ),
    );
  }
}
