import 'package:flutter/foundation.dart';

abstract final class AssetPaths {
  static const contentBase = 'assets/content/';
  static const imagesBase = 'assets/images/';
  static const animationsBase = 'assets/animations/';
  static const audioBase = 'assets/audio/';

  static const coursesJson = '${contentBase}courses.json';
  static const lessonsJson = '${contentBase}lessons.json';
  static const quizzesJson = '${contentBase}quizzes.json';
  static const categoriesJson = '${contentBase}categories.json';
  static const achievementsJson = '${contentBase}achievements.json';
  static const badgesJson = '${contentBase}badges.json';
  static const glossaryJson = '${contentBase}glossary.json';

  static String normalize(String assetPath) {
    if (kIsWeb && assetPath.startsWith('assets/')) {
      return assetPath.substring('assets/'.length);
    }
    return assetPath;
  }
}
