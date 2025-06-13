import 'package:flutter/material.dart';
import 'package:elearningapp/utils/colors.dart';

class FavoriteListView extends StatelessWidget {
   FavoriteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite List'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.favorite, color: AppColors.accent, size: 40),
              title: const Text('Advanced Flutter Animations'),
              subtitle: const Text('12 Lessons'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.favorite, color: AppColors.accent, size: 40),
              title: const Text('UI/UX Design Principles'),
              subtitle: const Text('8 Lessons'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.favorite, color: AppColors.accent, size: 40),
              title: const Text('Machine Learning Basics'),
              subtitle: const Text('10 Lessons'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.favorite, color: AppColors.accent, size: 40),
              title: const Text('Web Development with React'),
              subtitle: const Text('15 Lessons'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.favorite, color: AppColors.accent, size: 40),
              title: const Text('Data Science with Python'),
              subtitle: const Text('20 Lessons'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: AppColors.card,
            child: ListTile(
              leading:
                  const Icon(Icons.favorite, color: AppColors.accent, size: 40),
              title: const Text('Cloud Computing Fundamentals'),
              subtitle: const Text('18 Lessons'),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
