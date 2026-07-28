import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/asset_paths.dart';
import '../../../data/models/course.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key, required this.courses});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Text('No courses found.'),
      );
    }

    return Column(
      children: courses
          .map(
            (course) => Card(
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
                          AssetPaths.normalize(course.image),
                          width: 110,
                          height: 92,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(width: 110, height: 92, color: Theme.of(context).colorScheme.primaryContainer),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(course.categoryId.toUpperCase(), style: Theme.of(context).textTheme.labelSmall),
                            const SizedBox(height: 4),
                            Text(course.title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
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
            ),
          )
          .toList(),
    );
  }
}
