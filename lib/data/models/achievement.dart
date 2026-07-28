class Achievement {
  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.xpReward,
    required this.targetType,
    required this.targetValue,
    required this.isHidden,
  });

  final String id;
  final String title;
  final String description;
  final String icon;
  final int xpReward;
  final String targetType;
  final int targetValue;
  final bool isHidden;

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
        xpReward: json['xpReward'] as int? ?? 0,
        targetType: json['targetType'] as String,
        targetValue: json['targetValue'] as int? ?? 0,
        isHidden: json['isHidden'] as bool? ?? false,
      );
}
