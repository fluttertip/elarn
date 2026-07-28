import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/asset_paths.dart';
import '../../data/models/course.dart';
import '../../data/stores/app_providers.dart';
import 'widgets/course_grid.dart';
import 'widgets/filter_sheet.dart';

class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});
  @override ConsumerState<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  String query = '';
  String? level;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(coursesProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Could not load catalog: $e')),
      data: (courses) {
        final filtered = courses.where((course) {
          final haystack = '${course.title} ${course.description} ${course.categoryId} ${course.tags.join(' ')}'.toLowerCase();
          return (query.isEmpty || haystack.contains(query.toLowerCase())) &&
              (level == null || course.level == level);
        }).toList();
        return ListView(padding: const EdgeInsets.all(24), children: [
          Text('Explore courses', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          const Text('Choose a path, learn at your pace, and keep your progress offline.'),
          const SizedBox(height: 20),
          InkWell(
            onTap: () => context.push('/catalog/search'),
            child: IgnorePointer(
              child: TextField(
                onChanged: (value) => setState(() => query = value),
                decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search by topic, skill, or course'),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Wrap(spacing: 8, children: [
            ChoiceChip(label: const Text('All levels'), selected: level == null, onSelected: (_) => setState(() => level = null)),
            for (final item in ['Beginner', 'Intermediate', 'Advanced']) ChoiceChip(label: Text(item), selected: level == item, onSelected: (_) => setState(() => level = item)),
          ]),
          const SizedBox(height: 20),
          Text('${filtered.length} courses', style: const TextStyle(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          CourseGrid(courses: filtered),
        ]);
      },
    );
  }
}

class _CatalogCard extends StatelessWidget {
  const _CatalogCard({required this.course});
  final Course course;
  @override
  Widget build(BuildContext context) => Card(margin: const EdgeInsets.only(bottom: 14), child: InkWell(
    borderRadius: BorderRadius.circular(24),
    onTap: () => context.push('/course/${course.id}'),
    child: Padding(padding: const EdgeInsets.all(14), child: Row(children: [
      ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset(AssetPaths.normalize(course.image), width: 110, height: 92, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width: 110, height: 92, color: Theme.of(context).colorScheme.primaryContainer))),
      const SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(course.categoryId.toUpperCase(), style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 4),
        Text(course.title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
        const SizedBox(height: 5),
        Text('${course.level}  •  ${course.durationMinutes} min  •  ★ ${course.rating}'),
      ])),
      const Icon(Icons.chevron_right),
    ])),
  ));
}
