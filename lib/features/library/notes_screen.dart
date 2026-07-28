import 'package:elearningapp/data/models/note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/stores/app_providers.dart';
import 'widgets/note_card.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(progressRepositoryProvider).notes();

    if (notes.isEmpty) {
      return const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SizedBox.shrink(),
        ),
        body: Center(child: Text('No notes yet.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final entry = notes.entries.elementAt(index);
          return NoteCard(
            note: Note(
              id: entry.key,
              lessonId: entry.key,
              title: entry.key,
              body: entry.value,
              createdAt: '',
              updatedAt: '',
              pinned: false,
            ),
          );
        },
      ),
    );
  }
}
