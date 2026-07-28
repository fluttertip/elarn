class ProgressSummary {
  const ProgressSummary({
    required this.userId,
    required this.completedLessonIds,
    required this.bookmarkedCourseIds,
    required this.xp,
    required this.streak,
    required this.scoreByLessonId,
    required this.noteCount,
    required this.lastActiveAt,
  });

  final String userId;
  final List<String> completedLessonIds;
  final List<String> bookmarkedCourseIds;
  final int xp;
  final int streak;
  final Map<String, int> scoreByLessonId;
  final int noteCount;
  final String lastActiveAt;

  factory ProgressSummary.fromJson(Map<String, dynamic> json) => ProgressSummary(
        userId: json['userId'] as String,
        completedLessonIds: List<String>.from(json['completedLessonIds'] ?? const []),
        bookmarkedCourseIds: List<String>.from(json['bookmarkedCourseIds'] ?? const []),
        xp: json['xp'] as int? ?? 0,
        streak: json['streak'] as int? ?? 0,
        scoreByLessonId: (json['scoreByLessonId'] as Map<String, dynamic>? ?? const {})
            .map((key, value) => MapEntry(key, value as int)),
        noteCount: json['noteCount'] as int? ?? 0,
        lastActiveAt: json['lastActiveAt'] as String,
      );
}
