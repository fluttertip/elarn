import 'package:elearningapp/data/models/achievement.dart';
import 'package:elearningapp/data/models/badge.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Achievement parses the documented JSON shape', () {
    final achievement = Achievement.fromJson({
      'id': 'first-lesson',
      'title': 'First Steps',
      'description': 'Complete your first lesson.',
      'icon': 'assets/images/achievements/first-lesson.png',
      'xpReward': 100,
      'targetType': 'lessons_completed',
      'targetValue': 1,
      'isHidden': false,
    });

    expect(achievement.title, 'First Steps');
    expect(achievement.xpReward, 100);
    expect(achievement.isHidden, false);
  });

  test('Badge parses the documented JSON shape', () {
    final badge = Badge.fromJson({
      'id': 'streak-7',
      'name': '7-Day Streak',
      'description': 'Maintain a 7-day learning streak.',
      'icon': 'assets/images/badges/streak-7.png',
      'rarity': 'Gold',
      'earnedAt': '2026-07-28T09:00:00Z',
    });

    expect(badge.name, '7-Day Streak');
    expect(badge.rarity, 'Gold');
    expect(badge.earnedAt, '2026-07-28T09:00:00Z');
  });
}
