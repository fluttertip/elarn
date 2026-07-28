import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/stores/app_providers.dart';

class LessonScreen extends ConsumerStatefulWidget {
  const LessonScreen({super.key, required this.lessonId});
  final String lessonId;
  @override ConsumerState<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends ConsumerState<LessonScreen> {
  final noteController = TextEditingController();
  @override void dispose() { noteController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final lesson = ref.watch(lessonProvider(widget.lessonId));
    final progress = ref.watch(progressRepositoryProvider);
    final done = progress.completedLessons.contains(widget.lessonId);
    return lesson.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(appBar: AppBar(), body: Center(child: Text('$e'))),
      data: (value) => Scaffold(appBar: AppBar(title: Text(value.title)), body: ListView(padding: const EdgeInsets.all(22), children: [
        Text(value.title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 8), Text('${value.minutes} min  •  ${value.summary}'),
        const SizedBox(height: 24),
        for (final section in value.sections) Padding(padding: const EdgeInsets.only(bottom: 22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(section.heading, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w900)), const SizedBox(height: 8), Text(section.body, style: const TextStyle(fontSize: 17, height: 1.55))])),
        Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Key takeaways', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)), const SizedBox(height: 10), for (final item in value.takeaways) Padding(padding: const EdgeInsets.only(bottom: 8), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Icon(Icons.check, size: 20, color: Colors.green), const SizedBox(width: 8), Expanded(child: Text(item))]))]))),
        const SizedBox(height: 18),
        TextField(controller: noteController, maxLines: 4, decoration: const InputDecoration(labelText: 'Your note', hintText: 'Capture the idea you want to remember...')),
        const SizedBox(height: 8),
        Align(alignment: Alignment.centerRight, child: TextButton.icon(onPressed: () => ref.read(progressRepositoryProvider).saveNote(widget.lessonId, noteController.text), icon: const Icon(Icons.save_outlined), label: const Text('Save note'))),
        const SizedBox(height: 10),
        FilledButton.icon(onPressed: done ? null : () async { await ref.read(progressRepositoryProvider).completeLesson(widget.lessonId); if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lesson complete. +50 XP'))); }, icon: Icon(done ? Icons.check : Icons.done_all), label: Text(done ? 'Completed' : 'Mark lesson complete')),
        if (value.quizId != null) Padding(padding: const EdgeInsets.only(top: 10), child: OutlinedButton.icon(onPressed: () => context.push('/quiz/${value.id}'), icon: const Icon(Icons.quiz_outlined), label: const Text('Take the quiz'))),
      ])),
    );
  }
}
