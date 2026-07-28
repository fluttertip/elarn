import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/course.dart';

class FeaturedCourses extends StatelessWidget {
  const FeaturedCourses({super.key, required this.courses, required this.query});

  final List<Course> courses;
  final String query;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(query.isEmpty ? 'Featured for you' : 'Search results', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
        const SizedBox(height: 14),
        ...courses.map((course) => _CourseTile(course: course)),
      ],
    );
  }
}

class _CourseTile extends StatelessWidget {
  const _CourseTile({required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.only(bottom: 14),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => context.push('/course/${course.id}'),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    course.image,
                    width: 92,
                    height: 92,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(width: 92, height: 92, color: Theme.of(context).colorScheme.primaryContainer),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.categoryId.toUpperCase(), style: Theme.of(context).textTheme.labelSmall),
                      const SizedBox(height: 4),
                      Text(course.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 5),
                      Text('${course.level}  •  ${course.durationMinutes} min  •  ★ ${course.rating}'),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      );
}
