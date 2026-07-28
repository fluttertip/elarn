import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/storage_keys.dart';

class ProgressRepository extends ChangeNotifier {
  ProgressRepository(this._prefs);
  final SharedPreferences _prefs;

  static const completedKey = StorageKeys.progressCompleted;
  static const bookmarksKey = StorageKeys.progressBookmarks;
  static const notesKey = StorageKeys.progressNotes;
  static const scoresKey = StorageKeys.progressScores;
  static const xpKey = StorageKeys.progressXp;
  static const streakKey = StorageKeys.progressStreak;

  Set<String> get completedLessons =>
      (_prefs.getStringList(completedKey) ?? const []).toSet();
  Set<String> get bookmarks =>
      (_prefs.getStringList(bookmarksKey) ?? const []).toSet();
  int get xp => _prefs.getInt(xpKey) ?? 0;
  int get streak => _prefs.getInt(streakKey) ?? 0;

  Future<void> completeLesson(String id) async {
    if (completedLessons.contains(id)) return;
    await _prefs.setStringList(completedKey, {...completedLessons, id}.toList());
    await _prefs.setInt(xpKey, xp + 50);
    await _prefs.setInt(streakKey, streak == 0 ? 1 : streak + 1);
    notifyListeners();
  }

  Future<void> toggleBookmark(String id) async {
    final next = {...bookmarks};
    next.contains(id) ? next.remove(id) : next.add(id);
    await _prefs.setStringList(bookmarksKey, next.toList());
    notifyListeners();
  }

  Future<void> saveNote(String lessonId, String text) async {
    final next = _readMap(notesKey);
    next[lessonId] = text;
    await _writeMap(notesKey, next);
    notifyListeners();
  }

  Map<String, String> notes() => _readMap(notesKey);

  Map<String, String> _readMap(String key) => {
        for (final item in _prefs.getStringList(key) ?? const [])
          if (item.contains('::')) item.split('::').first: item.split('::').skip(1).join('::'),
      };

  Future<void> _writeMap(String key, Map<String, String> value) =>
      _prefs.setStringList(key, value.entries.map((e) => '${e.key}::${e.value}').toList());

Future<void> saveQuizScore(String lessonId, int score) async {
  final scores = _readMap(scoresKey);
  scores[lessonId] = '$score';
  await _writeMap(scoresKey, scores);
  await _prefs.setInt(xpKey, xp + score * 20);
  notifyListeners();
}

Future<void> setDisplayName(String value) async {
  await _prefs.setString('settings.v1.name', value.trim().isEmpty ? 'Learner' : value.trim());
  notifyListeners();
}

String get displayName => _prefs.getString(StorageKeys.settingsName) ?? 'Learner';
Map<String, String> scores() => _readMap(scoresKey);

Future<void> setOnboarded(bool value) async {
  await _prefs.setBool(StorageKeys.settingsOnboarded, value);
  notifyListeners();
}

bool get isOnboarded => _prefs.getBool(StorageKeys.settingsOnboarded) ?? false;

}
