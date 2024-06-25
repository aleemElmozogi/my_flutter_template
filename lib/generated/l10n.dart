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
  String get appName {
    return Intl.message(
      'My Flutter Template',
      name: 'appName',
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
  String get internetConnectionError {
    return Intl.message(
      'Please check your internet connection and try again',
      name: 'internetConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
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

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
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
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while parsing the QR code`
  String get qrParsingError {
    return Intl.message(
      'An error occurred while parsing the QR code',
      name: 'qrParsingError',
      desc: '',
      args: [],
    );
  }

  /// `Reload Screen`
  String get reloadScreen {
    return Intl.message(
      'Reload Screen',
      name: 'reloadScreen',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get wantToLogout {
    return Intl.message(
      'Do you want to log out?',
      name: 'wantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with phone number`
  String get signinWithPhone {
    return Intl.message(
      'Sign in with phone number',
      name: 'signinWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Verify with phone number`
  String get verifyWithPhone {
    return Intl.message(
      'Verify with phone number',
      name: 'verifyWithPhone',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Email`
  String get changeEmail {
    return Intl.message(
      'Change Email',
      name: 'changeEmail',
      desc: '',
      args: [],
    );
  }

  /// `A code will be sent to the phone number`
  String get codeWillBeSent {
    return Intl.message(
      'A code will be sent to the phone number',
      name: 'codeWillBeSent',
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
  String get codeHasBeenSent {
    return Intl.message(
      'The code has been sent to your phone number',
      name: 'codeHasBeenSent',
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
  String get enterPin {
    return Intl.message(
      'Enter PIN',
      name: 'enterPin',
      desc: '',
      args: [],
    );
  }

  /// `Enter the number of the friend to be added`
  String get enterNumberToAdd {
    return Intl.message(
      'Enter the number of the friend to be added',
      name: 'enterNumberToAdd',
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
  String get addFriend {
    return Intl.message(
      'Add Friend',
      name: 'addFriend',
      desc: '',
      args: [],
    );
  }

  /// `Use a strong PIN for your account`
  String get useStrongPin {
    return Intl.message(
      'Use a strong PIN for your account',
      name: 'useStrongPin',
      desc: '',
      args: [],
    );
  }

  /// `Enter new PIN`
  String get enterNewPin {
    return Intl.message(
      'Enter new PIN',
      name: 'enterNewPin',
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
  String get passwordErrorMessage {
    return Intl.message(
      'Password must be at least 8 digits',
      name: 'passwordErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number in the correct format`
  String get phoneErrorMessage {
    return Intl.message(
      'Please enter the phone number in the correct format',
      name: 'phoneErrorMessage',
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
