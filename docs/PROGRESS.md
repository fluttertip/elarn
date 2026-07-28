# Progress

## Done
- pubspec.yaml, project scaffold
- Theme (app_colors.dart, app_theme.dart)
- Models: course.dart, lesson.dart, quiz.dart
- Repositories: content_repository.dart, progress_repository.dart
- Stores: app_providers.dart, settings_store.dart
- Routing: app_router.dart (/, /catalog, /course/:id, /lesson/:id,
  /quiz/:id, /library, /progress, /profile)
- Shell: app_shell.dart (responsive rail/bottom nav)
- Screens: home, catalog, course, lesson, quiz, library, progress, profile
- Content: courses.json, lessons.json, quizzes.json (sample data only)
- Shared constants and utilities: app_constants.dart, asset_paths.dart,
  storage_keys.dart, route_names.dart, app_strings.dart,
  json_loader.dart, formatter.dart, validators.dart
- Reusable widgets: premium_button.dart, premium_card.dart,
  section_header.dart, loading_view.dart, empty_state.dart,
  error_state.dart, search_bar.dart, stat_card.dart, xp_badge.dart,
  streak_card.dart, progress_ring.dart, bookmark_button.dart
- Added data models for categories, instructors, modules, flashcards,
  achievements, badges, notes, and progress summary
- Built the flashcards feature end to end: sample JSON content,
  repository support, Riverpod provider, controller, card UI, and
  /flashcards/:courseId screen
- Added standalone library screens for bookmarks and notes, with
  shared repository-backed state and route links from the library view
- Added standalone catalog search and category screens, plus shared
  course grid and filter UI for the catalog experience
- Split profile settings into dedicated settings, appearance, and about
  screens with navigation from the profile landing page
- Added progress achievements and analytics screens with content-backed
  cards, weekly insights, and navigation from the progress landing page
- Added a splash screen and first-run onboarding flow with optional
  preferences capture, gated by SharedPreferences and routed through the
  app router
- Refactored the home screen into a controller plus extracted widget
  components for greeting, search, featured courses, and streak/XP while
  preserving the existing UI behavior
- Added a non-blocking AI tutor backend layer with isolated models,
  a Gemini service, a Riverpod-backed controller, and regression tests
  that keep the existing lesson/course/quiz flows unchanged

## Not started (v2 scope, do not build yet)
- AI tutor screen/UI entry point
- Audio feedback (audio_service.dart, assets/audio/*)
- Animations (Lottie assets, confetti)
- Analytics screen/service
- Cloud sync

## Known gaps within "done" scope
See docs/KNOWN_GAPS.md

## Last updated
2026-07-28 — initial setup from Batches 1-3