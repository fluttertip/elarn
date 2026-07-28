import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProgressRing extends StatelessWidget {
  const ProgressRing({super.key, required this.value, this.size = 96, this.strokeWidth = 10, this.label});

  final double value;
  final double size;
  final double strokeWidth;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: clamped,
                strokeWidth: strokeWidth,
                backgroundColor: AppColors.violetSoft.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation(AppColors.violet),
              ),
              Center(
                child: Text('${(clamped * 100).round()}%', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 8),
          Text(label!, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.ink.withOpacity(0.7))),
        ],
      ],
    );
  }
}
