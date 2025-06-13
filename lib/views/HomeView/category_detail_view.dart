import 'package:flutter/material.dart';
import 'package:elearningapp/utils/colors.dart';

class CategoryDetailView extends StatelessWidget {
  final String name;
  final String image;
  final int totalCourses;

  const CategoryDetailView({
    Key? key,
    required this.name,
    required this.image,
    required this.totalCourses,
  }) : super(key: key);

  String getDescription() {
    switch (name) {
      case 'English':
        return 'Master the English language with our comprehensive courses. Improve your grammar, vocabulary, and communication skills for personal and professional growth.';
      case 'Programming':
        return 'Dive into the world of programming! Learn popular languages, frameworks, and build real-world projects to kickstart your tech career.';
      case 'Accounting':
        return 'Understand the fundamentals of accounting, financial statements, and bookkeeping. Perfect for aspiring accountants and business owners.';
      case 'Marketing':
        return 'Explore modern marketing strategies, digital campaigns, and branding techniques to boost your business or personal brand.';
      case 'Photography':
        return 'Capture stunning photos! Learn about camera settings, composition, editing, and storytelling through images.';
      case 'Designing':
        return 'Unleash your creativity with our design courses. From graphic design to UI/UX, learn the tools and principles to create beautiful visuals.';
      default:
        return 'Explore this category for more information and courses!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total Courses: $totalCourses',
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.accent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    getDescription(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Popular Courses',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._getPopularCourses(name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getPopularCourses(String category) {
    final Map<String, List<Map<String, String>>> courses = {
      'English': [
        {'title': 'English Grammar Mastery', 'desc': 'All levels • 24 lessons'},
        {'title': 'Business English', 'desc': 'Intermediate • 18 lessons'},
      ],
      'Programming': [
        {'title': 'Flutter for Beginners', 'desc': 'Beginner • 30 lessons'},
        {'title': 'Advanced Dart', 'desc': 'Advanced • 20 lessons'},
      ],
      'Accounting': [
        {'title': 'Accounting Basics', 'desc': 'Beginner • 15 lessons'},
        {'title': 'Financial Statements', 'desc': 'Intermediate • 10 lessons'},
      ],
      'Marketing': [
        {'title': 'Digital Marketing 101', 'desc': 'Beginner • 22 lessons'},
        {'title': 'Brand Building', 'desc': 'All levels • 12 lessons'},
      ],
      'Photography': [
        {'title': 'DSLR Photography', 'desc': 'Beginner • 18 lessons'},
        {'title': 'Photo Editing', 'desc': 'Intermediate • 14 lessons'},
      ],
      'Designing': [
        {'title': 'UI/UX Fundamentals', 'desc': 'Beginner • 20 lessons'},
        {'title': 'Graphic Design Pro', 'desc': 'Advanced • 25 lessons'},
      ],
    };

    return (courses[category] ?? [])
        .map((course) => Card(
              color: AppColors.card,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.play_circle_fill,
                    color: AppColors.primary),
                title: Text(course['title']!),
                subtitle: Text(course['desc']!),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Start'),
                ),
              ),
            ))
        .toList();
  }
}
