import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/stores/app_providers.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = [
      _OnboardingPage(
        title: 'Learn at your own pace',
        body: 'Track lessons, bookmarks, notes, and streaks from one calm space.',
        icon: Icons.auto_awesome,
      ),
      _OnboardingPage(
        title: 'Stay consistent',
        body: 'Progress bars and achievements keep your momentum visible.',
        icon: Icons.timeline,
      ),
      _OnboardingPage(
        title: 'Personalize your journey',
        body: 'Add your name and interests to make the experience feel more relevant.',
        icon: Icons.person_outline,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(page.icon, size: 48, color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 24),
                  Text(page.title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800), textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  Text(page.body, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                  const SizedBox(height: 32),
                  if (index == pages.length - 1)
                    FilledButton.icon(
                      onPressed: () async {
                        await ref.read(progressRepositoryProvider.notifier).setOnboarded(true);
                        if (!context.mounted) return;
                        context.go('/preferences');
                      },
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: const Text('Continue'),
                    )
                  else
                    OutlinedButton(
                      onPressed: () => context.go('/preferences'),
                      child: const Text('Skip'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OnboardingPage {
  const _OnboardingPage({required this.title, required this.body, required this.icon});
  final String title;
  final String body;
  final IconData icon;
}
