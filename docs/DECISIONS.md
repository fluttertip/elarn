# Decisions Log

## 2026-07-28 — SharedPreferences over Isar for v1
Reason: older ELearn docs used Isar + freezed + build_runner and caused
package-version mismatches across sessions. Riverpod + SharedPreferences +
plain JSON assets is enough for the v1 feature set and has zero codegen risk.
Revisit only if a v2 feature genuinely needs a real local database.

## 2026-07-28 — go_router with single ShellRoute
Reason: need deep-linkable routes + responsive nav (rail vs bottom bar)
without duplicating navigation logic per screen.

## 2026-07-28 — AI tutor kept as optional, non-blocking backend
Reason: the tutor is implemented as an isolated Riverpod-backed service/controller
layer that can be enabled later without touching the existing lesson/course/quiz
flow or router structure. It fails gracefully with a friendly state when no API key
is configured.