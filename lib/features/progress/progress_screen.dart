import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/stores/app_providers.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressRepositoryProvider);
    final courses = ref.watch(coursesProvider);
    return ListView(padding: const EdgeInsets.all(24), children: [
      Text('Your progress', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
      const SizedBox(height: 20),
      Row(children: [Expanded(child: _Metric(label: 'XP', value: '${progress.xp}', icon: Icons.bolt)), const SizedBox(width: 12), Expanded(child: _Metric(label: 'Lessons', value: '${progress.completedLessons.length}', icon: Icons.school_outlined)), const SizedBox(width: 12), Expanded(child: _Metric(label: 'Streak', value: '${progress.streak}', icon: Icons.local_fire_department))]),
      const SizedBox(height: 20),
      Row(children: [
        Expanded(child: FilledButton.tonal(onPressed: () => context.go('/progress/achievements'), child: const Text('Achievements'))),
        const SizedBox(width: 12),
        Expanded(child: OutlinedButton(onPressed: () => context.go('/progress/analytics'), child: const Text('Analytics'))),
      ]),
      const SizedBox(height: 28),
      const Text('Course completion', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
      const SizedBox(height: 12),
      courses.when(loading: () => const CircularProgressIndicator(), error: (e, _) => Text('$e'), data: (items) => Column(children: [for (final course in items) Card(margin: const EdgeInsets.only(bottom: 10), child: ListTile(title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.w800)), subtitle: Padding(padding: const EdgeInsets.only(top: 8), child: LinearProgressIndicator(value: course.lessonIds.isEmpty ? 0 : course.lessonIds.where(progress.completedLessons.contains).length / course.lessonIds.length)), trailing: Text('${course.lessonIds.where(progress.completedLessons.contains).length}/${course.lessonIds.length}')))])),
    ]);
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;
  @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: Theme.of(context).colorScheme.primary), const SizedBox(height: 8), Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)), Text(label)])));
}
