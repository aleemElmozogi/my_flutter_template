import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final Function() onPressed;
  const AppCustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.contentPadding,
    this.backgroundColor,
    this.borderColor = AppColors.grey,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
              contentPadding ?? EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all<Color>(
              backgroundColor ?? Theme.of(context).scaffoldBackgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: borderColor)))),
      onPressed: onPressed,
      child: child,
    );
  }
}
