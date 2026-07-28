class Course {
  const Course({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.image,
    required this.level,
    required this.durationMinutes,
    required this.rating,
    required this.featured,
    required this.tags,
    required this.lessonIds,
    required this.outcomes,
  });

  final String id;
  final String categoryId;
  final String title;
  final String description;
  final String image;
  final String level;
  final int durationMinutes;
  final double rating;
  final bool featured;
  final List<String> tags;
  final List<String> lessonIds;
  final List<String> outcomes;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'] as String,
        categoryId: json['categoryId'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
        level: json['level'] as String,
        durationMinutes: json['durationMinutes'] as int,
        rating: (json['rating'] as num).toDouble(),
        featured: json['featured'] as bool? ?? false,
        tags: List<String>.from(json['tags'] ?? const []),
        lessonIds: List<String>.from(json['lessonIds'] ?? const []),
        outcomes: List<String>.from(json['outcomes'] ?? const []),
      );
}
