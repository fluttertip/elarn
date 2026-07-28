import 'package:flutter/material.dart';
import '../../data/models/course.dart';

class HomeController extends ChangeNotifier {
  String query = '';

  void onQueryChanged(String value) {
    query = value;
    notifyListeners();
  }

  List<Course> filterCourses(List<Course> courses) {
    final q = query.toLowerCase();
    if (q.isEmpty) return courses;
    return courses.where((course) {
      final haystack = '${course.title} ${course.description} ${course.tags.join(' ')}'.toLowerCase();
      return haystack.contains(q);
    }).toList();
  }
}
