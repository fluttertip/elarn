import '../repositories/progress_repository.dart';

class BookmarkRepository {
  BookmarkRepository(this._progressRepository);

  final ProgressRepository _progressRepository;

  Set<String> get bookmarks => _progressRepository.bookmarks;

  Future<void> toggleBookmark(String id) => _progressRepository.toggleBookmark(id);
}
