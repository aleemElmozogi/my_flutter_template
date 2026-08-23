import 'package:flutter/material.dart';
import 'package:my_flutter_template/config/themes/app_theme.dart';

class AppCustomButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsets? contentPadding;
  final VoidCallback onPressed;
  const AppCustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.contentPadding,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          contentPadding ?? EdgeInsets.zero,
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? theme.colorScheme.surface,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor ?? theme.appColors.border),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
