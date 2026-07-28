import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';
import 'widgets/bookmark_tile.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesProvider);
    final saved = ref.watch(progressRepositoryProvider).bookmarks;

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: courses.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('$error')),
        data: (items) {
          final list = items.where((course) => saved.contains(course.id)).toList();
          if (list.isEmpty) {
            return const Center(child: Text('No saved courses yet.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: list.length,
            itemBuilder: (context, index) => BookmarkTile(course: list[index]),
          );
        },
      ),
    );
  }
}
