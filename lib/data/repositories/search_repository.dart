import '../models/course.dart';
import 'content_repository.dart';

class SearchRepository {
  SearchRepository(this._contentRepository);

  final ContentRepository _contentRepository;

  Future<List<Course>> search(String query) => _contentRepository.search(query);

  Future<List<Course>> filterByCategory(String categoryId) async {
    final courses = await _contentRepository.getCourses();
    return courses.where((course) => course.categoryId == categoryId).toList();
  }

  Future<List<Course>> filterByLevel(String? level) async {
    final courses = await _contentRepository.getCourses();
    if (level == null || level.isEmpty) return courses;
    return courses.where((course) => course.level == level).toList();
  }
}
