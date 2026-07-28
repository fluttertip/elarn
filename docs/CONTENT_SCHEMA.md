# Content JSON Schema (canonical — do not deviate)

## courses.json
{
  "id": "flutter-foundations",
  "categoryId": "programming",
  "title": "Flutter Foundations",
  "description": "...",
  "image": "assets/images/Appdev.jpg",
  "level": "Beginner",
  "durationMinutes": 240,
  "rating": 4.9,
  "featured": true,
  "tags": ["Flutter", "Dart", "UI"],
  "lessonIds": ["flutter-01"],
  "outcomes": ["Build reusable widgets"]
}

## lessons.json
{
  "id": "flutter-01",
  "courseId": "flutter-foundations",
  "title": "The widget mindset",
  "summary": "...",
  "minutes": 12,
  "sections": [{"heading": "...", "body": "..."}],
  "takeaways": ["..."],
  "quizId": "flutter-01-quiz"
}

## quizzes.json
{
  "lessonId": "flutter-01",
  "questions": [{
    "question": "...",
    "answers": ["...", "...", "...", "..."],
    "correctIndex": 1,
    "explanation": "..."
  }]
}

## categories.json (proposed)
{
  "id": "programming",
  "title": "Programming",
  "slug": "programming",
  "description": "...",
  "icon": "assets/images/categories/programming.png",
  "courseIds": ["flutter-foundations"]
}

## instructors.json (proposed)
{
  "id": "maya-li",
  "name": "Maya Li",
  "title": "Flutter educator",
  "bio": "...",
  "avatar": "assets/images/instructors/maya-li.png",
  "specialties": ["Flutter", "UI"],
  "rating": 4.9
}

## modules.json (proposed)
{
  "id": "flutter-foundations-module-01",
  "courseId": "flutter-foundations",
  "title": "Getting started",
  "summary": "...",
  "lessonIds": ["flutter-01"],
  "order": 1
}

## flashcards.json (proposed)
{
  "id": "flutter-01-01",
  "courseId": "flutter-foundations",
  "front": "What is a Widget?",
  "back": "A Widget is the basic building block of a Flutter UI.",
  "tags": ["widgets", "ui"],
  "difficulty": "Beginner"
}

## achievements.json (proposed)
{
  "id": "first-lesson",
  "title": "First Steps",
  "description": "Complete your first lesson.",
  "icon": "assets/images/achievements/first-lesson.png",
  "xpReward": 100,
  "targetType": "lessons_completed",
  "targetValue": 1,
  "isHidden": false
}

## badges.json (proposed)
{
  "id": "streak-7",
  "name": "7-Day Streak",
  "description": "Maintain a 7-day learning streak.",
  "icon": "assets/images/badges/streak-7.png",
  "rarity": "Gold",
  "earnedAt": "2026-07-28T09:00:00Z"
}

## notes.json (proposed)
{
  "id": "note-flutter-01",
  "lessonId": "flutter-01",
  "title": "Widget notes",
  "body": "...",
  "createdAt": "2026-07-28T09:00:00Z",
  "updatedAt": "2026-07-28T09:15:00Z",
  "pinned": false
}

## progress-summary (proposed, not a content asset)
{
  "userId": "local",
  "completedLessonIds": ["flutter-01"],
  "bookmarkedCourseIds": ["flutter-foundations"],
  "xp": 350,
  "streak": 4,
  "scoreByLessonId": {"flutter-01": 80},
  "noteCount": 2,
  "lastActiveAt": "2026-07-28T09:30:00Z"
}

## Adding new content types
Any new JSON file (categories.json, achievements.json, etc.) needs its shape
documented here BEFORE a model/repository is written against it. If you're
an agent about to invent a schema for one of these, stop and either ask the
user for the shape or propose one here first — don't silently guess.