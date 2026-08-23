import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_template/config/themes/theme_cubit.dart';
import 'package:my_flutter_template/core/localStorage/loacal_storage.dart';

void main() {
  test('ThemeCubit defaults to system when no theme mode is saved', () async {
    final cubit = ThemeCubit(_FakeLocalStorage());

    await cubit.stream.first;

    expect(cubit.state.themeMode, ThemeMode.system);

    await cubit.close();
  });

  test('ThemeCubit loads saved theme mode', () async {
    final cubit = ThemeCubit(_FakeLocalStorage(savedThemeMode: 'dark'));

    await cubit.stream.first;

    expect(cubit.state.themeMode, ThemeMode.dark);

    await cubit.close();
  });

  test('ThemeCubit saves theme mode changes', () async {
    final storage = _FakeLocalStorage();
    final cubit = ThemeCubit(storage);
    await cubit.stream.first;

    await cubit.changeThemeMode(ThemeMode.light);

    expect(storage.savedThemeMode, ThemeMode.light.name);
    expect(cubit.state.themeMode, ThemeMode.light);

    await cubit.close();
  });
}

class _FakeLocalStorage implements LocalStorage {
  _FakeLocalStorage({this.savedThemeMode});

  String? savedThemeMode;

  @override
  Future<String?> getSavedThemeMode() async => savedThemeMode;

  @override
  Future<bool> saveThemeMode(String themeMode) async {
    savedThemeMode = themeMode;
    return true;
  }

  @override
  Future<String> get accessToken async => '';

  @override
  Future<String> get publicToken async => '';

  @override
  Future<String> get refreshToken async => '';

  @override
  Future<bool> get isFirstStart async => false;

  @override
  Future<bool> get isSubscribeToNotificationTopic async => true;

  @override
  Future<void> appStarted() async {}

  @override
  Future<bool> changeLang({required String langCode}) async => true;

  @override
  Future<String> getSavedLang() async => 'ar,LY';

  @override
  Future<void> refreshAccessToken(String value) async {}

  @override
  Future<void> refreshPublicToken(String value) async {}

  @override
  Future<void> refreshRefreshTokenToken(String value) async {}

  @override
  Future<void> subscribeToNotificationTopic() async {}

  @override
  Future<void> unSubscribeToNotificationTopic() async {}
}
