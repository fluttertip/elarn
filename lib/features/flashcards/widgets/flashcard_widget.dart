import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/models/flashcard.dart';

class FlashcardWidget extends StatelessWidget {
  const FlashcardWidget({
    super.key,
    required this.flashcard,
    required this.isFlipped,
    required this.onTap,
  });

  final Flashcard flashcard;
  final bool isFlipped;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 280),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            colors: [AppColors.violet.withOpacity(0.95), AppColors.coral.withOpacity(0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.violetSoft.withOpacity(0.18),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFlipped ? 'Answer' : 'Question',
              style: textTheme.labelLarge?.copyWith(color: Colors.white.withOpacity(0.9), letterSpacing: 1.2),
            ),
            const SizedBox(height: 16),
            Text(
              isFlipped ? flashcard.back : flashcard.front,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Text(
              isFlipped ? 'Tap to show question' : 'Tap to show answer',
              style: textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.85)),
            ),
          ],
        ),
      ),
    );
  }
}
