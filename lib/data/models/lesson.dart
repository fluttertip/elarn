class Lesson {
  const Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.summary,
    required this.minutes,
    required this.sections,
    required this.takeaways,
    this.quizId,
  });

  final String id;
  final String courseId;
  final String title;
  final String summary;
  final int minutes;
  final List<LessonSection> sections;
  final List<String> takeaways;
  final String? quizId;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json['id'] as String,
        courseId: json['courseId'] as String,
        title: json['title'] as String,
        summary: json['summary'] as String,
        minutes: json['minutes'] as int,
        sections: (json['sections'] as List)
            .map((e) => LessonSection.fromJson(e as Map<String, dynamic>))
            .toList(),
        takeaways: List<String>.from(json['takeaways'] ?? const []),
        quizId: json['quizId'] as String?,
      );
}

class LessonSection {
  const LessonSection({required this.heading, required this.body});
  final String heading;
  final String body;

  factory LessonSection.fromJson(Map<String, dynamic> json) => LessonSection(
        heading: json['heading'] as String,
        body: json['body'] as String,
      );
}
