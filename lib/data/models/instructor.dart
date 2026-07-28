class Instructor {
  const Instructor({
    required this.id,
    required this.name,
    required this.title,
    required this.bio,
    required this.avatar,
    required this.specialties,
    required this.rating,
  });

  final String id;
  final String name;
  final String title;
  final String bio;
  final String avatar;
  final List<String> specialties;
  final double rating;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json['id'] as String,
        name: json['name'] as String,
        title: json['title'] as String,
        bio: json['bio'] as String,
        avatar: json['avatar'] as String,
        specialties: List<String>.from(json['specialties'] ?? const []),
        rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      );
}
