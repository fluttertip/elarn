import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/stores/app_providers.dart';

class PreferencesScreen extends ConsumerStatefulWidget {
  const PreferencesScreen({super.key});

  @override
  ConsumerState<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends ConsumerState<PreferencesScreen> {
  final _nameController = TextEditingController();
  final _interestController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _interestController.dispose();
    super.dispose();
  }

  Future<void> _saveAndContinue() async {
    final repo = ref.read(progressRepositoryProvider.notifier);
    await repo.setDisplayName(_nameController.text);
    await repo.setOnboarded(true);
    if (!mounted) return;
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tell us a bit about you', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Text('This is optional, and you can change it later in your profile.', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Your name', hintText: 'Alex'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _interestController,
                decoration: const InputDecoration(labelText: 'What do you want to learn?', hintText: 'Flutter, UI design, math'),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _saveAndContinue,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Start learning'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
