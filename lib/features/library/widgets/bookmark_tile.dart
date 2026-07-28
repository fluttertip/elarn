import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/course.dart';

class BookmarkTile extends StatelessWidget {
  const BookmarkTile({super.key, required this.course, this.onTap});

  final Course course;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(course.categoryId),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap ?? () => context.push('/course/${course.id}'),
      ),
    );
  }
}
