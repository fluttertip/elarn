class Badge {
  const Badge({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.rarity,
    required this.earnedAt,
  });

  final String id;
  final String name;
  final String description;
  final String icon;
  final String rarity;
  final String earnedAt;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
        rarity: json['rarity'] as String,
        earnedAt: json['earnedAt'] as String? ?? '',
      );
}
