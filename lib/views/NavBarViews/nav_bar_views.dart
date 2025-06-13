import 'package:elearningapp/utils/colors.dart';
import 'package:elearningapp/views/NavBarViews/MyLearningView.dart';
import 'package:elearningapp/views/NavBarViews/gavoritelistview.dart';
import 'package:elearningapp/views/NavBarViews/settingview.dart';
import 'package:flutter/material.dart';
import 'package:elearningapp/views/HomeView/home_view.dart';

class NavBarViews extends StatefulWidget {
  const NavBarViews({Key? key}) : super(key: key);

  @override
  State<NavBarViews> createState() => _NavBarViewsState();
}

class _NavBarViewsState extends State<NavBarViews> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(key: ValueKey(0)),
    const MyLearningView(),
    const FavoriteListView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.star),
            icon: Icon(Icons.star_border),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.play_circle),
            icon: Icon(Icons.play_circle_outlined),
            label: 'My Learning',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favorite List',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
