import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    final bars = [3.0, 4.5, 2.2, 5.0, 3.8, 4.2, 6.0];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 180,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(bars.length, (index) {
              final label = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: bars[index] * 24,
                        decoration: BoxDecoration(
                          color: index == 6 ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(label, style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
