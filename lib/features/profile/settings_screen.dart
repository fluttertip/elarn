import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/stores/app_providers.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late final TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: ref.read(progressRepositoryProvider).displayName);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Display name'),
            onSubmitted: (value) => ref.read(progressRepositoryProvider).setDisplayName(value),
          ),
          const SizedBox(height: 14),
          FilledButton(
            onPressed: () => ref.read(progressRepositoryProvider).setDisplayName(nameController.text),
            child: const Text('Save profile'),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text('Appearance'),
            subtitle: const Text('Theme and display preferences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/profile/appearance'),
          ),
        ],
      ),
    );
  }
}
