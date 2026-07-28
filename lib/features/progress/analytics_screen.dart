import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';
import 'widgets/statistics_card.dart';
import 'widgets/weekly_chart.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressRepositoryProvider);
    final badges = ref.watch(badgesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          StatisticsCard(progress: progress),
          const SizedBox(height: 20),
          Text('Weekly activity', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          const WeeklyChart(),
          const SizedBox(height: 20),
          Text('Badges', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          badges.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text('$error'),
            data: (items) => Wrap(
              spacing: 12,
              runSpacing: 12,
              children: items.map((badge) => Chip(
                avatar: const Icon(Icons.emoji_events_outlined, size: 18),
                label: Text(badge.name),
                side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
