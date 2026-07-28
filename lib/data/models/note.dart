class Note {
  const Note({
    required this.id,
    required this.lessonId,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    required this.pinned,
  });

  final String id;
  final String lessonId;
  final String title;
  final String body;
  final String createdAt;
  final String updatedAt;
  final bool pinned;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'] as String,
        lessonId: json['lessonId'] as String,
        title: json['title'] as String,
        body: json['body'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        pinned: json['pinned'] as bool? ?? false,
      );
}
