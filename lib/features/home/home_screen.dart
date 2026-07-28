import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';
import 'home_controller.dart';
import 'widgets/featured_courses.dart';
import 'widgets/greeting_header.dart';
import 'widgets/search_section.dart';
import 'widgets/streak_xp_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final courses = ref.watch(coursesProvider);
    final progress = ref.watch(progressRepositoryProvider);

    return courses.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Could not load courses: $e')),
      data: (items) {
        final filtered = _controller.filterCourses(items);
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const GreetingHeader(),
            SearchSection(query: _controller.query, onChanged: _controller.onQueryChanged),
            const SizedBox(height: 22),
            StreakXpCard(completedLessons: progress.completedLessons.length, xp: progress.xp),
            const SizedBox(height: 28),
            FeaturedCourses(courses: filtered, query: _controller.query),
          ],
        );
      },
    );
  }
}
