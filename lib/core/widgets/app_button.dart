import 'package:my_flutter_template/core/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onTab;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool withSplash;
  final Color? foregroundColor;
  final bool isSemanticButton;
  final double borderRadius;
  final double? height;
  final double width;
  final Color? titleColor;
  final EdgeInsets innerPadding;
  final double elevation; // Add elevation property

  const AppButton({
    super.key,
    required this.title,
    required this.onTab,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 10,
    this.height,
    this.elevation = 0,
    this.withSplash = true,
    this.width = double.infinity,
    this.innerPadding = const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
    this.foregroundColor,
    this.isSemanticButton = false,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveTitleColor = titleColor ?? colorScheme.onPrimary;

    return SizedBox(
      height: height?.h,
      width: width,
      child: TextButton(
        isSemanticButton: isSemanticButton,
        style: ButtonStyle(
          overlayColor: withSplash
              ? null
              : WidgetStateColor.resolveWith((states) => Colors.transparent),
          padding: WidgetStateProperty.all<EdgeInsets>(innerPadding),
          foregroundColor: WidgetStateProperty.all<Color>(
            foregroundColor ?? effectiveTitleColor,
          ),
          backgroundColor: WidgetStateColor.resolveWith((states) => effectiveBackgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
          ),
        ),
        onPressed: () => onTab(),
        child: Center(child: AppText(title, textColor: effectiveTitleColor)),
      ),
    );
  }
}
