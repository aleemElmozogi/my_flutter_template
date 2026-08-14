import 'package:flutter/material.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_theme.tailor.dart';

/// A theme_tailor extension class for any custom colors we may add later.
@TailorMixin()
class AppCustomColors extends ThemeExtension<AppCustomColors>
    with _$AppCustomColorsTailorMixin {
  AppCustomColors({required this.brandAccent});

  @override
  final Color brandAccent;

  static final light = AppCustomColors(brandAccent: const Color(0xFF6BA56C));
  static final dark = AppCustomColors(brandAccent: const Color(0xFF1E2C1E));
}

ThemeData get lightAppTheme {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6BA56C),
    brightness: Brightness.light,
  );
  final scaffoldTint = Color.alphaBlend(
    scheme.primary.withValues(alpha: 0.04),
    scheme.surface,
  );

  return _buildAppTheme(
    colorScheme: scheme,
    scaffoldBackgroundColor: scaffoldTint,
    customColors: AppCustomColors.light,
  );
}

ThemeData get darkAppTheme {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF1E2C1E),
    brightness: Brightness.dark,
  );
  final scaffoldTint = Color.alphaBlend(
    scheme.primary.withValues(alpha: 0.04),
    scheme.surface,
  );

  return _buildAppTheme(
    colorScheme: scheme,
    scaffoldBackgroundColor: scaffoldTint,
    customColors: AppCustomColors.dark,
  );
}

ThemeData _buildAppTheme({
  required ColorScheme colorScheme,
  required Color scaffoldBackgroundColor,
  required AppCustomColors customColors,
}) {
  final base = ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    fontFamily: AppStrings.fontFamily,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    extensions: [customColors],
  );
  final textTheme = base.textTheme.apply(
    bodyColor: colorScheme.onSurface,
    displayColor: colorScheme.onSurface,
  );

  return base.copyWith(
    textTheme: textTheme,
    primaryTextTheme: base.primaryTextTheme.apply(
      bodyColor: colorScheme.onPrimary,
      displayColor: colorScheme.onPrimary,
    ),
    canvasColor: colorScheme.surface,
    cardColor: colorScheme.surface,
    dividerColor: colorScheme.outlineVariant,
    iconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.onPrimary,
        fontFamily: AppStrings.fontFamily,
        fontWeight: FontWeight.w700,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      indicatorColor: colorScheme.primary.withValues(alpha: 0.14),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? colorScheme.primary : colorScheme.onSurfaceVariant,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return textTheme.labelSmall?.copyWith(
          color: selected ? colorScheme.primary : colorScheme.onSurfaceVariant,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        );
      }),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      prefixIconColor: colorScheme.onSurfaceVariant,
      suffixIconColor: colorScheme.onSurfaceVariant,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.primary, width: 1.2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: colorScheme.error, width: 1.2),
      ),
    ),
  );
}
