import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key, required this.query, required this.onChanged});

  final String query;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: onChanged,
          decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search courses, skills, topics...'),
        ),
        const SizedBox(height: 22),
      ],
    );
  }
}
