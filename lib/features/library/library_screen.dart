import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/stores/app_providers.dart';
import 'bookmarks_screen.dart';
import 'notes_screen.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(coursesProvider);
    final saved = ref.watch(progressRepositoryProvider).bookmarks;

    return courses.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Scaffold(body: Center(child: Text('$e'))),
      data: (items) {
        final list = items.where((course) => saved.contains(course.id)).toList();
        return Scaffold(
          appBar: AppBar(title: const Text('Your library')),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              if (list.isNotEmpty) ...[
                const Text('Saved courses', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                ...list.map((course) => ListTile(
                      title: Text(course.title),
                      subtitle: Text(course.categoryId),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/course/${course.id}'),
                    )),
                const SizedBox(height: 24),
              ] else
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('No saved courses yet.'),
                ),
              ListTile(
                leading: const Icon(Icons.bookmark_rounded),
                title: const Text('Bookmarks'),
                subtitle: const Text('View all your saved courses'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/library/bookmarks'),
              ),
              ListTile(
                leading: const Icon(Icons.note_alt_outlined),
                title: const Text('Notes'),
                subtitle: const Text('Browse your saved notes'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/library/notes'),
              ),
            ],
          ),
        );
      },
    );
  }
}
