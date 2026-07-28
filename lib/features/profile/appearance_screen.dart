import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/settings_store.dart';

class AppearanceScreen extends ConsumerWidget {
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Appearance')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: SwitchListTile(
              value: dark,
              onChanged: (value) => ref.read(themeModeProvider.notifier).setDark(value),
              title: const Text('Dark mode'),
              subtitle: const Text('Use the darker learning environment'),
            ),
          ),
        ],
      ),
    );
  }
}
