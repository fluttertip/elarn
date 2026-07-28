import '../repositories/progress_repository.dart';

class NotesRepository {
  NotesRepository(this._progressRepository);

  final ProgressRepository _progressRepository;

  Map<String, String> get notes => _progressRepository.notes();

  Future<void> saveNote(String lessonId, String text) => _progressRepository.saveNote(lessonId, text);
}
