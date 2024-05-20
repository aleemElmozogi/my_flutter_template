import 'package:my_flutter_template/core/enums/local_keys.dart';
import 'package:my_flutter_template/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<String> get accessToken;
  Future<String> get publicToken;
  Future<bool> get isSubscribeToNotificationTopic;
  Future<void> refreshAccessToken(String value);
  Future<void> subscribeToNotificationTopic();
  Future<void> unSubscribeToNotificationTopic();
  Future<void> refreshPublicToken(String value);
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

@Singleton(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
          encryptedSharedPreferences: true, resetOnError: false),
  iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock
  )
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
        : AppStrings.englishCode;
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
  Future<void> subscribeToNotificationTopic() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool(
        AppStrings.notificationTopicSubscribe, true);
  }

  @override
  Future<void> unSubscribeToNotificationTopic() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.setBool(
        AppStrings.notificationTopicSubscribe, false);
  }

  @override
  Future<String> get accessToken async =>
      await secureStorage.read(
          key: LocalStorageKeys.accessToken.toEncryptedKey) ??
      '';

  @override
  Future<String> get publicToken async =>
      await secureStorage.read(
          key: LocalStorageKeys.publicToken.toEncryptedKey) ??
      '';

  @override
  Future<void> refreshAccessToken(String value) => secureStorage.write(
      key: LocalStorageKeys.accessToken.toEncryptedKey,
      value: value.toString());
  @override
  Future<void> refreshPublicToken(String value) => secureStorage.write(
      key: LocalStorageKeys.publicToken.toEncryptedKey,
      value: value.toString());
}
