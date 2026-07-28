import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key, required this.xp});

  final int xp;

  @override
  Widget build(BuildContext context) {
    final level = (xp ~/ 250) + 1;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Text('$level', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Level $level', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text('$xp XP earned so far', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
