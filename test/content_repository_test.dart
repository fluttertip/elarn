import 'package:flutter_test/flutter_test.dart';
import 'package:elearningapp/data/models/course.dart';
import 'package:elearningapp/data/repositories/content_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Course parses the canonical JSON shape', () {
    final course = Course.fromJson({
      'id': 'x', 'categoryId': 'programming', 'title': 'Test', 'description': 'Desc',
      'image': 'assets/images/test.png', 'level': 'Beginner', 'durationMinutes': 20,
      'rating': 4.5, 'featured': true, 'tags': ['Dart'], 'lessonIds': ['l1'],
      'outcomes': ['Build'],
    });
    expect(course.title, 'Test');
    expect(course.rating, 4.5);
    expect(course.lessonIds, ['l1']);
  });

  test('The Flutter course exposes multiple lessons from content assets', () async {
    final repository = ContentRepository();
    final courses = await repository.getCourses();
    final flutterCourse = courses.firstWhere((course) => course.id == 'flutter-foundations');

    expect(flutterCourse.lessonIds, containsAll(['flutter-02', 'flutter-03']));
  });
}
