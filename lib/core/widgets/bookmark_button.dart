import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({super.key, required this.isBookmarked, this.onPressed});

  final bool isBookmarked;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: Icon(isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded),
      style: IconButton.styleFrom(
        backgroundColor: isBookmarked ? AppColors.violet.withOpacity(0.14) : Theme.of(context).colorScheme.surfaceContainerHighest,
        foregroundColor: isBookmarked ? AppColors.violet : AppColors.ink,
      ),
    );
  }
}
