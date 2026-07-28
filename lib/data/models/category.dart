class Category {
  const Category({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.icon,
    required this.courseIds,
  });

  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;
  final List<String> courseIds;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String,
        title: json['title'] as String,
        slug: json['slug'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
        courseIds: List<String>.from(json['courseIds'] ?? const []),
      );
}
