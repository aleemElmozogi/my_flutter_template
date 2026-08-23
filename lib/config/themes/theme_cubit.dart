import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._localStorage) : super(const ThemeState(ThemeMode.system)) {
    loadSavedThemeMode();
  }

  final LocalStorage _localStorage;

  Future<void> loadSavedThemeMode() async {
    final savedThemeMode = await _localStorage.getSavedThemeMode();
    emit(ThemeState(_themeModeFromName(savedThemeMode)));
  }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    await _localStorage.saveThemeMode(themeMode.name);
    emit(ThemeState(themeMode));
  }

  ThemeMode _themeModeFromName(String? value) {
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }
}
