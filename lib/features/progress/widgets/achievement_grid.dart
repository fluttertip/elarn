import 'package:flutter/material.dart';
import '../../../data/models/achievement.dart';

class AchievementGrid extends StatelessWidget {
  const AchievementGrid({super.key, required this.achievements, required this.completed});

  final List<Achievement> achievements;
  final int completed;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.95,
      children: achievements.map((achievement) {
        final unlocked = completed >= achievement.targetValue;
        return Card(
          color: unlocked ? Theme.of(context).colorScheme.primaryContainer : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  unlocked ? Icons.emoji_events : Icons.lock_outline,
                  color: unlocked ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
                  size: 28,
                ),
                const SizedBox(height: 10),
                Text(achievement.title, style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(achievement.description, style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                Text('${achievement.xpReward} XP', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
