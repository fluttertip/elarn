import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('ELearn 4.0', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          const Text('Offline-first learning experience built for focused study, progress tracking, and reusable content.'),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Version'),
            subtitle: const Text('1.0.0'),
          ),
          const ListTile(
            leading: Icon(Icons.offline_pin_outlined),
            title: Text('Offline content bundle'),
            subtitle: Text('All content is stored locally for a reliable learning experience.'),
          ),
        ],
      ),
    );
  }
}
