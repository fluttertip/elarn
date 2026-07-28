import 'package:flutter_test/flutter_test.dart';
import 'package:elearningapp/data/models/quiz.dart';

void main() {
  test('Quiz parses questions and correct answer index', () {
    final quiz = Quiz.fromJson({'lessonId': 'l1', 'questions': [{'question': '2+2?', 'answers': ['3', '4'], 'correctIndex': 1, 'explanation': 'Basic arithmetic'}]});
    expect(quiz.questions.single.correctIndex, 1);
    expect(quiz.questions.single.answers[1], '4');
  });
}
