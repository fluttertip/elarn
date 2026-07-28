import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repositories/content_repository.dart';
import '../repositories/progress_repository.dart';

final preferencesProvider = Provider<SharedPreferences>((ref) =>
    throw UnimplementedError('Override preferencesProvider in main.dart'));

final contentRepositoryProvider = Provider<ContentRepository>((ref) =>
    ContentRepository());

final progressRepositoryProvider = ChangeNotifierProvider<ProgressRepository>((ref) =>
    ProgressRepository(ref.watch(preferencesProvider)));

final coursesProvider = FutureProvider((ref) =>
    ref.watch(contentRepositoryProvider).getCourses());

final courseProvider = FutureProvider.family((ref, String id) =>
    ref.watch(contentRepositoryProvider).getCourse(id));

final lessonProvider = FutureProvider.family((ref, String id) =>
    ref.watch(contentRepositoryProvider).getLesson(id));

final quizProvider = FutureProvider.family((ref, String lessonId) =>
    ref.watch(contentRepositoryProvider).getQuiz(lessonId));

final flashcardsProvider = FutureProvider.family((ref, String courseId) =>
    ref.watch(contentRepositoryProvider).getFlashcards(courseId));

final achievementsProvider = FutureProvider((ref) =>
    ref.watch(contentRepositoryProvider).getAchievements());

final badgesProvider = FutureProvider((ref) =>
    ref.watch(contentRepositoryProvider).getBadges());
