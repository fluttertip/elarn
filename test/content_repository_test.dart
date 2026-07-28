import 'package:flutter_test/flutter_test.dart';
import 'package:elearningapp/data/models/course.dart';

void main() {
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
}
