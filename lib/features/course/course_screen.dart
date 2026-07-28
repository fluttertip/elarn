import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/asset_paths.dart';
import '../../data/stores/app_providers.dart';

class CourseScreen extends ConsumerWidget {
  const CourseScreen({super.key, required this.courseId});
  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(courseProvider(courseId));
    final progress = ref.watch(progressRepositoryProvider);
    return state.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(appBar: AppBar(), body: Center(child: Text('$e'))),
      data: (course) {
        final completed = course.lessonIds.where(progress.completedLessons.contains).length;
        final saved = progress.bookmarks.contains(course.id);
        return Scaffold(appBar: AppBar(title: const Text('Course details')), body: ListView(padding: const EdgeInsets.all(20), children: [
          ClipRRect(borderRadius: BorderRadius.circular(28), child: Image.asset(AssetPaths.normalize(course.image), height: 220, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height: 220, color: Theme.of(context).colorScheme.primaryContainer))),
          const SizedBox(height: 20),
          Row(children: [Expanded(child: Text(course.title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900))), IconButton(onPressed: () => ref.read(progressRepositoryProvider).toggleBookmark(course.id), icon: Icon(saved ? Icons.bookmark : Icons.bookmark_outline))]),
          const SizedBox(height: 8),
          Text(course.description),
          const SizedBox(height: 14),
          Text('${course.level}  •  ${course.durationMinutes} minutes  •  ★ ${course.rating}', style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 22),
          LinearProgressIndicator(value: course.lessonIds.isEmpty ? 0 : completed / course.lessonIds.length, minHeight: 8),
          const SizedBox(height: 8),
          Text('$completed of ${course.lessonIds.length} lessons complete'),
          const SizedBox(height: 26),
          const Text('What you will learn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          for (final outcome in course.outcomes) ListTile(contentPadding: EdgeInsets.zero, leading: const Icon(Icons.check_circle, color: Colors.green), title: Text(outcome)),
          const SizedBox(height: 18),
          const Text('Lessons', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          for (var i = 0; i < course.lessonIds.length; i++) _LessonRow(id: course.lessonIds[i], number: i + 1, complete: progress.completedLessons.contains(course.lessonIds[i])),
        ]));
      },
    );
  }
}

class _LessonRow extends ConsumerWidget {
  const _LessonRow({required this.id, required this.number, required this.complete});
  final String id;
  final int number;
  final bool complete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesson = ref.watch(lessonProvider(id));
    return Card(margin: const EdgeInsets.only(bottom: 10), child: lesson.when(
      loading: () => const ListTile(title: Text('Loading lesson...')),
      error: (e, _) => ListTile(title: Text('Lesson $number'), subtitle: Text('$e')),
      data: (value) => ListTile(
        leading: CircleAvatar(child: complete ? const Icon(Icons.check) : Text('$number')),
        title: Text(value.title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text('${value.minutes} min  •  ${value.summary}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.push('/lesson/${value.id}'),
      ),
    ));
  }
}
