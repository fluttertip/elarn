import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/stores/app_providers.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressRepositoryProvider);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Profile & settings', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 24),
          CircleAvatar(radius: 38, child: Text(progress.displayName.characters.first.toUpperCase())),
          const SizedBox(height: 12),
          Text(progress.displayName, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              subtitle: const Text('Manage your profile and preferences'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/profile/settings'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.palette_outlined),
              title: const Text('Appearance'),
              subtitle: const Text('Dark mode and visual preferences'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/profile/appearance'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              subtitle: const Text('App information and version'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/profile/about'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bookmark_outline),
              title: const Text('Saved courses'),
              trailing: Text('${progress.bookmarks.length}'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.note_outlined),
              title: const Text('Notes'),
              trailing: Text('${progress.notes().length}'),
            ),
          ),
          const SizedBox(height: 18),
          const Text('ELearn 4.0  •  Offline content bundle', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
