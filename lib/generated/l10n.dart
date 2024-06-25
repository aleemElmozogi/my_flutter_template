// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: '',
      args: [],
    );
  }

  /// `My Flutter Template`
  String get app_name {
    return Intl.message(
      'My Flutter Template',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get opps {
    return Intl.message(
      'Oops!',
      name: 'opps',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again`
  String get internet_connection_error {
    return Intl.message(
      'Please check your internet connection and try again',
      name: 'internet_connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get try_again {
    return Intl.message(
      'Try Again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while parsing the QR code`
  String get qr_parsing_error {
    return Intl.message(
      'An error occurred while parsing the QR code',
      name: 'qr_parsing_error',
      desc: '',
      args: [],
    );
  }

  /// `Reload Screen`
  String get reload_screen {
    return Intl.message(
      'Reload Screen',
      name: 'reload_screen',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get want_to_logout {
    return Intl.message(
      'Do you want to log out?',
      name: 'want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with phone number`
  String get singin_with_phone {
    return Intl.message(
      'Sign in with phone number',
      name: 'singin_with_phone',
      desc: '',
      args: [],
    );
  }

  /// `Verify with phone number`
  String get verify_with_phone {
    return Intl.message(
      'Verify with phone number',
      name: 'verify_with_phone',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get change_email {
    return Intl.message(
      'Change Email',
      name: 'change_email',
      desc: '',
      args: [],
    );
  }

  /// `A code will be sent to the phone number`
  String get code_will_be_sent {
    return Intl.message(
      'A code will be sent to the phone number',
      name: 'code_will_be_sent',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continio {
    return Intl.message(
      'Continue',
      name: 'continio',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message(
      'Check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `The code has been sent to your phone number`
  String get code_has_been_sent {
    return Intl.message(
      'The code has been sent to your phone number',
      name: 'code_has_been_sent',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Enter PIN`
  String get enter_pin {
    return Intl.message(
      'Enter PIN',
      name: 'enter_pin',
      desc: '',
      args: [],
    );
  }

  /// `Enter the number of the friend to be added`
  String get enter_number_to_add {
    return Intl.message(
      'Enter the number of the friend to be added',
      name: 'enter_number_to_add',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Add Friend`
  String get add_friend {
    return Intl.message(
      'Add Friend',
      name: 'add_friend',
      desc: '',
      args: [],
    );
  }

  /// `Use a strong PIN for your account`
  String get use_strong_pin {
    return Intl.message(
      'Use a strong PIN for your account',
      name: 'use_strong_pin',
      desc: '',
      args: [],
    );
  }

  /// `Enter new PIN`
  String get enter_new_pin {
    return Intl.message(
      'Enter new PIN',
      name: 'enter_new_pin',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 digits`
  String get password_error_message {
    return Intl.message(
      'Password must be at least 8 digits',
      name: 'password_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number in the correct format`
  String get phone_error_message {
    return Intl.message(
      'Please enter the phone number in the correct format',
      name: 'phone_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Error during communication`
  String get errorDuringCommunication {
    return Intl.message(
      'Error during communication',
      name: 'errorDuringCommunication',
      desc: '',
      args: [],
    );
  }

  /// `No data or content available`
  String get noDataOrContentAvailable {
    return Intl.message(
      'No data or content available',
      name: 'noDataOrContentAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Invalid request`
  String get invalidRequest {
    return Intl.message(
      'Invalid request',
      name: 'invalidRequest',
      desc: '',
      args: [],
    );
  }

  /// `Invalid response`
  String get invalidResponse {
    return Intl.message(
      'Invalid response',
      name: 'invalidResponse',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `The requested information is not available`
  String get informationNotAvailable {
    return Intl.message(
      'The requested information is not available',
      name: 'informationNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `A conflict occurred`
  String get conflictOccurred {
    return Intl.message(
      'A conflict occurred',
      name: 'conflictOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get internalServerError {
    return Intl.message(
      'Internal server error',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
