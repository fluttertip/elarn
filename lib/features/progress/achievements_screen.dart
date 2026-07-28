import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';
import 'widgets/achievement_grid.dart';
import 'widgets/level_card.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievements = ref.watch(achievementsProvider);
    final progress = ref.watch(progressRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Achievements')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          LevelCard(xp: progress.xp),
          const SizedBox(height: 20),
          Text('Unlock milestones', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          achievements.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text('$error'),
            data: (items) => AchievementGrid(achievements: items, completed: progress.completedLessons.length),
          ),
        ],
      ),
    );
  }
}
