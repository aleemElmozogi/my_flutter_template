import 'package:flutter/material.dart';

class AppCustomButton extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final Color? foregroundColor;

  final EdgeInsets contentPadding;
  final Function() onPressed;
  const AppCustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 13,
      horizontal: 5,
    ),

    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 10,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedBorder = borderColor ?? colorScheme.outline;
    final resolvedBg = backgroundColor ?? colorScheme.primary;
    final resolvedFg = foregroundColor ?? colorScheme.onPrimary;
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(contentPadding),
        backgroundColor: WidgetStateProperty.all<Color>(resolvedBg),
        foregroundColor: WidgetStateProperty.all<Color>(resolvedFg),

        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: resolvedBorder),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
