# Agent Instructions — ELearn 4.0

Read `docs/PROGRESS.md` before making changes. Do not redo finished batches
or assume unfinished features exist.

## Hard rules
- State management: Riverpod only. Do not introduce Provider, Bloc, GetX.
- Local storage: SharedPreferences only for v1. Do NOT add Isar, Hive,
  freezed, or build_runner — this was tried before and caused version-mismatch
  churn. If a future batch genuinely needs codegen, log the decision in
  `docs/DECISIONS.md` first.
- Widgets never call SharedPreferences directly. All reads/writes go through
  a `*Repository` class.
- Content (courses/lessons/quizzes/etc.) comes from JSON assets in
  `assets/content/`, loaded via repositories in `lib/data/repositories/`.
  Match the shapes in `docs/CONTENT_SCHEMA.md` exactly — don't invent new
  field names for existing entities.
- Routing: go_router, one ShellRoute with bottom nav (<900px) / nav rail
  (>=900px). Routes must stay deep-linkable (see ARCHITECTURE.md for the list).
- Package versions are pinned in pubspec.lock. Don't bump a package version
  without a reason recorded in `docs/DECISIONS.md`.
- AI tutor, audio, animations, analytics are v2 scope. Don't wire them in
  while core offline loop work is unfinished.

## Workflow
- Before finishing a session: update `docs/PROGRESS.md` (what you added/changed)
  and, if you made an architectural choice, add an entry to `docs/DECISIONS.md`.
- If you find a gap (missing screen, missing JSON), add it to
  `docs/KNOWN_GAPS.md` rather than silently improvising a fix.

## Source of truth
`docs/` is the source of truth, not old chat transcripts or previous agent
sessions. If a chat and `docs/` disagree, `docs/` wins — update it if it's
actually stale.