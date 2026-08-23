import 'package:flutter/material.dart';
import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';

class AppTheme {
  static ThemeData light() => _buildTheme(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFDDF7E7),
      onPrimaryContainer: AppColors.primaryDark,
      secondary: AppColors.lightPrimary,
      onSecondary: AppColors.primaryDark,
      surface: Colors.white,
      onSurface: Color(0xFF1C1D1F),
      surfaceContainerHighest: Color(0xFFF4F6F5),
      outline: Color(0xFFE1E5E2),
      outlineVariant: Color(0xFFF0F2F0),
      error: Color(0xFFD92D20),
      onError: Colors.white,
    ),
    themeColors: const AppThemeColors(
      scaffold: Color(0xFFF8F4F0),
      card: Colors.white,
      fieldFill: Color(0xFFFAFAFA),
      border: Color(0xFFE1E5E2),
      mutedText: Color(0xFF5B625E),
      disabled: Color(0xFF9AA39E),
      success: AppColors.primary,
      warning: Color(0xFFF59E0B),
    ),
  );

  static ThemeData dark() => _buildTheme(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF5EE08D),
      onPrimary: Color(0xFF002A12),
      primaryContainer: Color(0xFF064F28),
      onPrimaryContainer: Color(0xFFDDF7E7),
      secondary: Color(0xFF9EE56F),
      onSecondary: Color(0xFF153300),
      surface: Color(0xFF111513),
      onSurface: Color(0xFFE8EEE9),
      surfaceContainerHighest: Color(0xFF1B211E),
      outline: Color(0xFF39433D),
      outlineVariant: Color(0xFF27302B),
      error: Color(0xFFFF6B5E),
      onError: Color(0xFF3B0600),
    ),
    themeColors: const AppThemeColors(
      scaffold: Color(0xFF0B0F0D),
      card: Color(0xFF151A17),
      fieldFill: Color(0xFF1B211E),
      border: Color(0xFF313A35),
      mutedText: Color(0xFFA9B3AD),
      disabled: Color(0xFF66716A),
      success: Color(0xFF5EE08D),
      warning: Color(0xFFFBBF24),
    ),
  );

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required AppThemeColors themeColors,
  }) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: themeColors.scaffold,
      fontFamily: AppStrings.fontFamily,
      extensions: [themeColors],
    );

    final textTheme = baseTheme.textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      fontFamily: AppStrings.fontFamily,
    );

    return baseTheme.copyWith(
      hintColor: themeColors.mutedText,
      disabledColor: themeColors.disabled,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        color: themeColors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: themeColors.border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: themeColors.fieldFill,
        labelStyle: TextStyle(color: themeColors.mutedText),
        hintStyle: TextStyle(color: themeColors.mutedText),
        contentPadding: const EdgeInsets.all(15),
        border: _outlineInputBorder(colorScheme.outline),
        enabledBorder: _outlineInputBorder(Colors.transparent),
        focusedBorder: _outlineInputBorder(colorScheme.primary),
        errorBorder: _outlineInputBorder(colorScheme.error),
        focusedErrorBorder: _outlineInputBorder(colorScheme.error),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: colorScheme.primaryContainer,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: isSelected ? colorScheme.primary : themeColors.mutedText,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final isSelected = states.contains(WidgetState.selected);
          return textTheme.labelMedium?.copyWith(
            color: isSelected ? colorScheme.primary : themeColors.mutedText,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          );
        }),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: themeColors.disabled,
          disabledForegroundColor: colorScheme.surface,
          textStyle: const TextStyle(fontFamily: AppStrings.fontFamily),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: themeColors.border),
    );
  }

  static OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 0.5),
    );
  }
}

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  const AppThemeColors({
    required this.scaffold,
    required this.card,
    required this.fieldFill,
    required this.border,
    required this.mutedText,
    required this.disabled,
    required this.success,
    required this.warning,
  });

  final Color scaffold;
  final Color card;
  final Color fieldFill;
  final Color border;
  final Color mutedText;
  final Color disabled;
  final Color success;
  final Color warning;

  @override
  AppThemeColors copyWith({
    Color? scaffold,
    Color? card,
    Color? fieldFill,
    Color? border,
    Color? mutedText,
    Color? disabled,
    Color? success,
    Color? warning,
  }) {
    return AppThemeColors(
      scaffold: scaffold ?? this.scaffold,
      card: card ?? this.card,
      fieldFill: fieldFill ?? this.fieldFill,
      border: border ?? this.border,
      mutedText: mutedText ?? this.mutedText,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      scaffold: Color.lerp(scaffold, other.scaffold, t)!,
      card: Color.lerp(card, other.card, t)!,
      fieldFill: Color.lerp(fieldFill, other.fieldFill, t)!,
      border: Color.lerp(border, other.border, t)!,
      mutedText: Color.lerp(mutedText, other.mutedText, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}

extension AppThemeDataX on ThemeData {
  AppThemeColors get appColors => extension<AppThemeColors>()!;
}

ThemeData appTheme() => AppTheme.light();
