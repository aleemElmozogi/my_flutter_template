import 'package:flutter/material.dart';
import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String title;
  final String? customFont;
  final double fontSize;
  final int? maxLines;
  final TextAlign textAlign;
  final Color? textColor;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;
  const AppText(
      this.title, {
        super.key,
        this.fontWeight = FontWeight.normal,
        this.fontSize = 14,
        this.overflow = TextOverflow.ellipsis,
        this.maxLines,
        this.textAlign = TextAlign.center,
        this.textColor,
        this.customFont,
        this.textDecoration,
      });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize.sp,
        color: textColor ?? colorScheme.onSurface,
        fontWeight: fontWeight,
        decoration: textDecoration,
        fontFamily: customFont ?? AppStrings.fontFamily,
      ),
    );
  }
}

