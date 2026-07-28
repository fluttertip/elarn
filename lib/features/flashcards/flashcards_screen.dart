import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/widgets/empty_state.dart';
import '../../core/widgets/loading_view.dart';
import '../../data/stores/app_providers.dart';
import 'flashcard_controller.dart';
import 'widgets/flashcard_widget.dart';

class FlashcardsScreen extends ConsumerStatefulWidget {
  const FlashcardsScreen({super.key, required this.courseId});

  final String courseId;

  @override
  ConsumerState<FlashcardsScreen> createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends ConsumerState<FlashcardsScreen> {
  late final FlashcardController controller;

  @override
  void initState() {
    super.initState();
    controller = FlashcardController(const []);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final flashcards = ref.watch(flashcardsProvider(widget.courseId));

    return flashcards.when(
      loading: () => const Scaffold(body: LoadingView(message: 'Loading flashcards…')),
      error: (error, _) => Scaffold(appBar: AppBar(title: const Text('Flashcards')), body: Center(child: Text('$error'))),
      data: (items) {
        if (items.isEmpty) {
          return const Scaffold(
            body: EmptyState(title: 'No flashcards yet', message: 'This course does not have flashcards available yet.'),
          );
        }

        controller.flashcards.isEmpty || controller.flashcards.length != items.length
            ? controller = FlashcardController(items)
            : null;

        return Scaffold(
          appBar: AppBar(
            title: Text('Flashcards • ${widget.courseId}'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text('${controller.currentIndex + 1}/${controller.totalCount}', style: Theme.of(context).textTheme.titleMedium),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) => FlashcardWidget(
                      flashcard: controller.currentFlashcard,
                      isFlipped: controller.isFlipped,
                      onTap: controller.flip,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: controller.canGoPrevious ? controller.previous : null,
                        icon: const Icon(Icons.chevron_left_rounded),
                        label: const Text('Previous'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: controller.canGoNext ? controller.next : null,
                        icon: const Icon(Icons.chevron_right_rounded),
                        label: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
