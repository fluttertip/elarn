import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class XpBadge extends StatelessWidget {
  const XpBadge({super.key, required this.xp});

  final int xp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.violet.withOpacity(0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome_rounded, color: AppColors.violet, size: 18),
          const SizedBox(width: 6),
          Text('$xp XP', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.violet, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
