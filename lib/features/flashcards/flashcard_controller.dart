import 'package:flutter/foundation.dart';
import '../../data/models/flashcard.dart';

class FlashcardController extends ChangeNotifier {
  FlashcardController(this.flashcards) : assert(flashcards.isNotEmpty);

  final List<Flashcard> flashcards;
  int currentIndex = 0;
  bool isFlipped = false;

  Flashcard get currentFlashcard => flashcards[currentIndex];
  int get totalCount => flashcards.length;
  bool get canGoNext => currentIndex < flashcards.length - 1;
  bool get canGoPrevious => currentIndex > 0;

  void flip() {
    isFlipped = !isFlipped;
    notifyListeners();
  }

  void next() {
    if (!canGoNext) return;
    currentIndex += 1;
    isFlipped = false;
    notifyListeners();
  }

  void previous() {
    if (!canGoPrevious) return;
    currentIndex -= 1;
    isFlipped = false;
    notifyListeners();
  }
}
