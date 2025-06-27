import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';

class AppSwapButton extends StatelessWidget {
  final VoidCallback onSwipe;
  final String title;
  const AppSwapButton({
    super.key,
    required this.onSwipe,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SwipeButton(
        activeThumbColor: AppColors.background,
        thumbPadding: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(12),
        activeTrackColor: AppColors.primary,
        height: 60,
        onSwipe: onSwipe,
        child: AppText(
          title,
          textColor: AppColors.white,
        ),
      ),
    );
  }
}
