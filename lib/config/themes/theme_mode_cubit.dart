import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_mode_state.dart';

/// Manages the app's [ThemeMode] and persists it to [SharedPreferences].
class ThemeModeCubit extends Cubit<ThemeMode> {
  static const _key = 'theme_mode';

  ThemeModeCubit() : super(ThemeMode.system) {
    _loadSavedThemeMode();
  }

  Future<void> _loadSavedThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key);
    if (value != null) {
      final mode = ThemeMode.values.firstWhere(
        (e) => e.name == value,
        orElse: () => ThemeMode.system,
      );
      emit(mode);
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }

  /// Convenience toggle: dark ↔ light (ignores system).
  Future<void> toggleTheme() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(next);
  }

  bool get isDarkMode => state == ThemeMode.dark;
}
