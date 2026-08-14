import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text.dart';

class AppClickableText extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final double borderRadius;
  final bool withSplash;
  final double fontSize;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? textColor;
  final TextDecoration textDecoration;
  const AppClickableText({
    super.key,
    required this.title,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
    this.borderRadius = 4,
    this.withSplash = true,
    this.splashColor,
    this.fontSize = 13,
    this.highlightColor,
    this.textColor,
    this.textDecoration = TextDecoration.underline,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius.r),
        splashColor: withSplash ? splashColor : Colors.transparent,
        highlightColor: withSplash ? highlightColor : Colors.transparent,
        child: Padding(
          padding: padding,
          child: AppText(
            title,
            textDecoration: textDecoration,
            fontSize: fontSize,
            textColor: textColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
