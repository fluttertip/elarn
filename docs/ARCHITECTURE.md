# Architecture

## Stack
Flutter + Riverpod (DI/state) + SharedPreferences (v1 persistence) +
go_router (routing) + JSON assets (content source).

No Isar, no freezed, no build_runner in v1 — deliberate choice, see
docs/DECISIONS.md.

## Folder layout
lib/
  main.dart
  app.dart
  core/            constants, theme, routing, widgets, utils
  data/
    models/        plain Dart classes with fromJson
    repositories/   the only layer allowed to touch SharedPreferences/assets
    services/
    stores/         Riverpod providers
  features/
    <feature>/
      <feature>_screen.dart
      widgets/

## Storage keys (SharedPreferences)
progress.v1.completed
progress.v1.bookmarks
progress.v1.notes
progress.v1.scores
progress.v1.xp
progress.v1.streak
settings.v1.dark
settings.v1.name

Keys are versioned (`.v1.`) so future migrations don't silently clobber data.

## Routes
/
/catalog
/course/:courseId
/lesson/:lessonId
/quiz/:lessonId
/flashcards/:courseId   (route defined, screen not yet built — see KNOWN_GAPS)
/library
/progress
/profile
/settings               (not yet built — see KNOWN_GAPS)

Shell route with bottom nav under 900px width, NavigationRail at/above 900px.
No mobile-only warning on web.