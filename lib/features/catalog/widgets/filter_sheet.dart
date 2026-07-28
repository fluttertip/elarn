import 'package:flutter/material.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key, required this.level, required this.onChanged});

  final String? level;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter by level', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(label: const Text('All levels'), selected: level == null, onSelected: (_) => onChanged(null)),
                for (final item in ['Beginner', 'Intermediate', 'Advanced'])
                  ChoiceChip(label: Text(item), selected: level == item, onSelected: (_) => onChanged(item)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
