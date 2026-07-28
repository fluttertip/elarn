import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key, required this.lessonId});
  final String lessonId;
  @override ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  int index = 0;
  int score = 0;
  int? selected;
  bool answered = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider(widget.lessonId));
    return Scaffold(appBar: AppBar(title: const Text('Practice')), body: state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (quiz) {
        if (quiz == null || quiz.questions.isEmpty) return const Center(child: Text('No quiz available yet.'));
        final question = quiz.questions[index];
        return ListView(padding: const EdgeInsets.all(22), children: [
          LinearProgressIndicator(value: (index + 1) / quiz.questions.length, minHeight: 8),
          const SizedBox(height: 28),
          Text('Question ${index + 1} of ${quiz.questions.length}', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 12),
          Text(question.question, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 22),
          for (var i = 0; i < question.answers.length; i++) _OptionTile(index: i, text: question.answers[i], selected: selected == i, correct: answered && i == question.correctIndex, wrong: answered && selected == i && i != question.correctIndex, onTap: answered ? null : () { setState(() { selected = i; answered = true; if (i == question.correctIndex) score++; }); }),
          if (answered) Card(child: Padding(padding: const EdgeInsets.all(16), child: Text(question.explanation))),
          if (answered) Padding(padding: const EdgeInsets.only(top: 20), child: FilledButton(onPressed: () async { if (index + 1 < quiz.questions.length) { setState(() { index++; selected = null; answered = false; }); } else { await ref.read(progressRepositoryProvider).saveQuizScore(widget.lessonId, score); if (context.mounted) showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Quiz complete'), content: Text('You scored $score/${quiz.questions.length}.'), actions: [TextButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), child: const Text('Done'))])); } }, child: Text(index + 1 == quiz.questions.length ? 'Finish' : 'Next'))),
        ]);
      },
    ));
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({required this.index, required this.text, required this.selected, required this.correct, required this.wrong, required this.onTap});
  final int index;
  final String text;
  final bool selected;
  final bool correct;
  final bool wrong;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Card(color: correct ? Colors.green.withValues(alpha: .12) : wrong ? Colors.red.withValues(alpha: .10) : null, margin: const EdgeInsets.only(bottom: 10), child: ListTile(onTap: onTap, leading: CircleAvatar(child: Text(String.fromCharCode(65 + index))), title: Text(text), trailing: correct ? const Icon(Icons.check, color: Colors.green) : wrong ? const Icon(Icons.close, color: Colors.red) : null));
}
