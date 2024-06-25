import 'package:my_flutter_template/core/utils/app_colors.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      hintColor: AppColors.grey,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily,
      colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          primaryContainer: Colors.white,
          surfaceTint: Colors.white),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: AppColors.primary,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.white,
              fontSize: 20)),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            height: 1.3,
            fontSize: 22,
            color: AppColors.primary,
            fontWeight: FontWeight.bold),
      ));
}
