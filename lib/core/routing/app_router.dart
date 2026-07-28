import 'package:elearningapp/features/library/library_screen.dart';
import 'package:elearningapp/features/quiz/quiz_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/catalog/catalog_screen.dart';
import '../../features/catalog/category_screen.dart';
import '../../features/catalog/search_screen.dart';
import '../../features/course/course_screen.dart';
import '../../features/flashcards/flashcards_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/lesson/lesson_screen.dart';
import '../../features/library/bookmarks_screen.dart';
import '../../features/library/notes_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/onboarding/preferences_screen.dart';
import '../../features/profile/about_screen.dart';
import '../../features/profile/appearance_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/profile/settings_screen.dart';
import '../../features/progress/achievements_screen.dart';
import '../../features/progress/analytics_screen.dart';
import '../../features/progress/progress_screen.dart';
import '../../features/shell/app_shell.dart';
import '../../features/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
    GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
    GoRoute(path: '/preferences', builder: (_, __) => const PreferencesScreen()),
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
        GoRoute(path: '/catalog', builder: (_, __) => const CatalogScreen()),
        GoRoute(path: '/catalog/search', builder: (_, __) => const SearchScreen()),
        GoRoute(path: '/catalog/category/:categoryId', builder: (_, state) => CategoryScreen(categoryId: state.pathParameters['categoryId']!)),
        GoRoute(path: '/progress', builder: (_, __) => const ProgressScreen()),
        GoRoute(path: '/progress/achievements', builder: (_, __) => const AchievementsScreen()),
        GoRoute(path: '/progress/analytics', builder: (_, __) => const AnalyticsScreen()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
        GoRoute(path: '/profile/settings', builder: (_, __) => const SettingsScreen()),
        GoRoute(path: '/profile/appearance', builder: (_, __) => const AppearanceScreen()),
        GoRoute(path: '/profile/about', builder: (_, __) => const AboutScreen()),
        GoRoute(path: '/library', builder: (_, __) => const LibraryScreen()),
        GoRoute(path: '/library/bookmarks', builder: (_, __) => const BookmarksScreen()),
        GoRoute(path: '/library/notes', builder: (_, __) => const NotesScreen()),
      ],
    ),
    GoRoute(
      path: '/course/:courseId',
      builder: (_, state) => CourseScreen(courseId: state.pathParameters['courseId']!),
    ),
    GoRoute(
      path: '/lesson/:lessonId',
      builder: (_, state) => LessonScreen(lessonId: state.pathParameters['lessonId']!),
    ),
    GoRoute(
      path: '/quiz/:lessonId',
      builder: (_, state) => QuizScreen(lessonId: state.pathParameters['lessonId']!),
    ),
    GoRoute(
      path: '/flashcards/:courseId',
      builder: (_, state) => FlashcardsScreen(courseId: state.pathParameters['courseId']!),
    ),
  ],
);
