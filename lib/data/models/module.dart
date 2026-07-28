class Module {
  const Module({
    required this.id,
    required this.courseId,
    required this.title,
    required this.summary,
    required this.lessonIds,
    required this.order,
  });

  final String id;
  final String courseId;
  final String title;
  final String summary;
  final List<String> lessonIds;
  final int order;

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json['id'] as String,
        courseId: json['courseId'] as String,
        title: json['title'] as String,
        summary: json['summary'] as String,
        lessonIds: List<String>.from(json['lessonIds'] ?? const []),
        order: json['order'] as int? ?? 0,
      );
}
