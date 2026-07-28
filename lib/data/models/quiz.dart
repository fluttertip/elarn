class Quiz {
  const Quiz({required this.lessonId, required this.questions});
  final String lessonId;
  final List<QuizQuestion> questions;
  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    lessonId: json['lessonId'] as String,
    questions: (json['questions'] as List).map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

class QuizQuestion {
  const QuizQuestion({required this.question, required this.answers, required this.correctIndex, required this.explanation});
  final String question;
  final List<String> answers;
  final int correctIndex;
  final String explanation;
  factory QuizQuestion.fromJson(Map<String, dynamic> json) => QuizQuestion(
    question: json['question'] as String,
    answers: List<String>.from(json['answers'] ?? const []),
    correctIndex: json['correctIndex'] as int,
    explanation: json['explanation'] as String? ?? '',
  );
}
