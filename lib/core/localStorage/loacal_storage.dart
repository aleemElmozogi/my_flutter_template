import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_flutter_template/core/enums/local_keys.dart';
import 'package:my_flutter_template/core/utils/app_locale.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<String> get accessToken;
  Future<String> get publicToken;
  Future<String> get refreshToken;
  Future<String> get savedLoginPhone;
  Future<String> get savedLoginPassword;
  Future<bool> get isFirstStart;
  Future<bool> get rememberLogin;
  Future<bool> get biometricLoginEnabled;
  Future<bool> get isSubscribeToNotificationTopic;
  Future<void> refreshAccessToken(String value);
  Future<void> refreshRefreshTokenToken(String value);
  Future<void> saveLoginCredentials({
    required String phone,
    required String password,
    required bool biometricEnabled,
  });
  Future<void> clearLoginCredentials();
  Future<void> subscribeToNotificationTopic();
  Future<void> appStarted();
  Future<void> unSubscribeToNotificationTopic();
  Future<void> refreshPublicToken(String value);
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
  Future<bool> saveThemeMode(String themeMode);
  Future<String?> getSavedThemeMode();
}

@Singleton(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(resetOnError: false),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  LocalStorageImpl();

  @override
  Future<bool> changeLang({required String langCode}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return await sharedPreferences.setString(AppStrings.locale, langCode);
  }

  @override
  Future<String> getSavedLang() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.containsKey(AppStrings.locale)
        ? sharedPreferences.getString(AppStrings.locale)!
        : AppLocale.ar.languageCode;
  }

  @override
  Future<bool> saveThemeMode(String themeMode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.setString(AppStrings.themeMode, themeMode);
  }

  @override
  Future<String?> getSavedThemeMode() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(AppStrings.themeMode);
  }

  @override
  Future<bool> get isSubscribeToNotificationTopic async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return (sharedPreferences.getBool(AppStrings.notificationTopicSubscribe) ??
            true) ==
        true;
  }

  @override
  Future<bool> get isFirstStart async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    return (sharedPreferences.getBool(AppStrings.isFirstStart) ?? true);
  }

  @override
  Future<void> appStarted() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool(AppStrings.isFirstStart, false);
  }

  @override
  Future<void> subscribeToNotificationTopic() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool(
      AppStrings.notificationTopicSubscribe,
      true,
    );
  }

  @override
  Future<void> unSubscribeToNotificationTopic() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.setBool(
      AppStrings.notificationTopicSubscribe,
      false,
    );
  }

  @override
  Future<String> get accessToken async =>
      await secureStorage.read(
        key: LocalStorageKeys.accessToken.toEncryptedKey,
      ) ??
      '';

  @override
  Future<String> get refreshToken async =>
      await secureStorage.read(
        key: LocalStorageKeys.refreshToken.toEncryptedKey,
      ) ??
      '';

  @override
  Future<String> get savedLoginPhone async =>
      await secureStorage.read(
        key: LocalStorageKeys.savedLoginPhone.toEncryptedKey,
      ) ??
      '';

  @override
  Future<String> get savedLoginPassword async =>
      await secureStorage.read(
        key: LocalStorageKeys.savedLoginPassword.toEncryptedKey,
      ) ??
      '';

  @override
  Future<String> get publicToken async =>
      await secureStorage.read(
        key: LocalStorageKeys.publicToken.toEncryptedKey,
      ) ??
      '';

  @override
  Future<void> refreshAccessToken(String value) => secureStorage.write(
    key: LocalStorageKeys.accessToken.toEncryptedKey,
    value: value.toString(),
  );

  @override
  Future<void> refreshRefreshTokenToken(String value) => secureStorage.write(
    key: LocalStorageKeys.refreshToken.toEncryptedKey,
    value: value.toString(),
  );

  @override
  Future<bool> get rememberLogin async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool(AppStrings.rememberLogin) ?? false;
  }

  @override
  Future<bool> get biometricLoginEnabled async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool(AppStrings.biometricLogin) ?? false;
  }

  @override
  Future<void> saveLoginCredentials({
    required String phone,
    required String password,
    required bool biometricEnabled,
  }) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await Future.wait([
      secureStorage.write(
        key: LocalStorageKeys.savedLoginPhone.toEncryptedKey,
        value: phone,
      ),
      secureStorage.write(
        key: LocalStorageKeys.savedLoginPassword.toEncryptedKey,
        value: password,
      ),
      sharedPreferences.setBool(AppStrings.rememberLogin, true),
      sharedPreferences.setBool(AppStrings.biometricLogin, biometricEnabled),
    ]);
  }

  @override
  Future<void> clearLoginCredentials() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await Future.wait([
      secureStorage.delete(
        key: LocalStorageKeys.savedLoginPhone.toEncryptedKey,
      ),
      secureStorage.delete(
        key: LocalStorageKeys.savedLoginPassword.toEncryptedKey,
      ),
      sharedPreferences.setBool(AppStrings.rememberLogin, false),
      sharedPreferences.setBool(AppStrings.biometricLogin, false),
    ]);
  }

  @override
  Future<void> refreshPublicToken(String value) => secureStorage.write(
    key: LocalStorageKeys.publicToken.toEncryptedKey,
    value: value.toString(),
  );
}
