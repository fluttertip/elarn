import 'dart:convert';
import 'package:elearningapp/data/models/flashcard.dart';
import 'package:elearningapp/data/models/quiz.dart';
import 'package:flutter/services.dart';
import '../models/achievement.dart';
import '../models/badge.dart';
import '../models/course.dart';
import '../models/lesson.dart';

class ContentRepository {
  List<Course>? _courses;
  final Map<String, Lesson> _lessons = {};
    final Map<String, Quiz> _quizzes = {};


  Future<List<Course>> getCourses() async {
    if (_courses != null) return _courses!;
    final raw = await rootBundle.loadString('assets/content/courses.json');
    final json = jsonDecode(raw) as List;
    return _courses = json
        .map((e) => Course.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Course> getCourse(String id) async {
    final courses = await getCourses();
    return courses.firstWhere((course) => course.id == id);
  }

  Future<List<Course>> search(String query) async {
    final courses = await getCourses();
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return courses;
    return courses.where((course) {
      final haystack = [
        course.title,
        course.description,
        course.categoryId,
        ...course.tags,
      ].join(' ').toLowerCase();
      return haystack.contains(q);
    }).toList();
  }

  Future<Lesson> getLesson(String id) async {
    if (_lessons.containsKey(id)) return _lessons[id]!;
    final raw = await rootBundle.loadString('assets/content/lessons.json');
    final json = jsonDecode(raw) as List;
    for (final value in json) {
      final lesson = Lesson.fromJson(value as Map<String, dynamic>);
      _lessons[lesson.id] = lesson;
    }
    final lesson = _lessons[id];
    if (lesson == null) throw StateError('Lesson not found: $id');
    return lesson;
  }


Future<Quiz?> getQuiz(String lessonId) async {
  if (_quizzes.containsKey(lessonId)) return _quizzes[lessonId];
  final raw = await rootBundle.loadString('assets/content/quizzes.json');
  for (final value in jsonDecode(raw) as List) {
    final quiz = Quiz.fromJson(value as Map<String, dynamic>);
    _quizzes[quiz.lessonId] = quiz;
  }
  return _quizzes[lessonId];
}

Future<List<Flashcard>> getFlashcards(String courseId) async {
  final raw = await rootBundle.loadString('assets/content/flashcards.json');
  final flashcards = (jsonDecode(raw) as List)
      .map((e) => Flashcard.fromJson(e as Map<String, dynamic>))
      .where((flashcard) => flashcard.courseId == courseId)
      .toList();
  return flashcards;
}

Future<List<Achievement>> getAchievements() async {
  final raw = await rootBundle.loadString('assets/content/achievements.json');
  return (jsonDecode(raw) as List)
      .map((e) => Achievement.fromJson(e as Map<String, dynamic>))
      .toList();
}

Future<List<Badge>> getBadges() async {
  final raw = await rootBundle.loadString('assets/content/badges.json');
  return (jsonDecode(raw) as List)
      .map((e) => Badge.fromJson(e as Map<String, dynamic>))
      .toList();
}
}
