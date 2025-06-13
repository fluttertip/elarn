import 'package:flutter/material.dart';
import 'package:elearningapp/utils/colors.dart';

class MyLearningView extends StatelessWidget {
   MyLearningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Learning'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Continue Learning',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading: const Icon(Icons.play_circle_fill,
                  color: AppColors.primary, size: 40),
              title: const Text('Flutter for Beginners'),
              subtitle: const Text('Chapter 3: Widgets'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Resume'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading: const Icon(Icons.play_circle_fill,
                  color: AppColors.primary, size: 40),
              title: const Text('Advanced Dart Programming'),
              subtitle: const Text('Chapter 5: Futures and Streams'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Resume'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading: const Icon(Icons.play_circle_fill,
                  color: AppColors.primary, size: 40),
              title: const Text('UI/UX Design Principles'),
              subtitle: const Text('Chapter 2: Color Theory'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Resume'),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Completed Courses',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.check_circle, color: Colors.green, size: 40),
              title: const Text('Dart Basics'),
              subtitle: const Text('Completed'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.check_circle, color: Colors.green, size: 40),
              title: const Text('Advanced Flutter'),
              subtitle: const Text('Completed'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.check_circle, color: Colors.green, size: 40),
              title: const Text('UI/UX Design Fundamentals'),
              subtitle: const Text('Completed'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.check_circle, color: Colors.green, size: 40),
              title: const Text('Web Development with React'),
              subtitle: const Text('Completed'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
