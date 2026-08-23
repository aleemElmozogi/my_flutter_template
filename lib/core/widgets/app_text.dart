import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';

class AppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final int? maxLines;
  final TextAlign textAlign;
  final Color? textColor;
  final TextOverflow overflow;
  final FontWeight fontWeight;

  const AppText(
    this.title, {
    super.key,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 16,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize.sp,
        color: textColor ?? Theme.of(context).colorScheme.onSurface,
        fontWeight: fontWeight,
        fontFamily: AppStrings.fontFamily,
      ),
    );
  }
}
