import 'package:flutter/material.dart';

class StreakXpCard extends StatelessWidget {
  const StreakXpCard({super.key, required this.completedLessons, required this.xp});

  final int completedLessons;
  final int xp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.local_fire_department, color: Colors.orange, size: 32),
            const SizedBox(width: 14),
            Expanded(child: Text('$completedLessons lessons completed', style: const TextStyle(fontWeight: FontWeight.w800))),
            Text('$xp XP', style: const TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}
