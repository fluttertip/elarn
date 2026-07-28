class Flashcard {
  const Flashcard({
    required this.id,
    required this.courseId,
    required this.front,
    required this.back,
    required this.tags,
    required this.difficulty,
  });

  final String id;
  final String courseId;
  final String front;
  final String back;
  final List<String> tags;
  final String difficulty;

  factory Flashcard.fromJson(Map<String, dynamic> json) => Flashcard(
        id: json['id'] as String,
        courseId: json['courseId'] as String,
        front: json['front'] as String,
        back: json['back'] as String,
        tags: List<String>.from(json['tags'] ?? const []),
        difficulty: json['difficulty'] as String,
      );
}
