import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'My Flutter Template'**
  String get app_name;

  /// No description provided for @opps.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get opps;

  /// No description provided for @internet_connection_error.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again'**
  String get internet_connection_error;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get try_again;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get something_went_wrong;

  /// No description provided for @qr_parsing_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while parsing the QR code'**
  String get qr_parsing_error;

  /// No description provided for @reload_screen.
  ///
  /// In en, this message translates to:
  /// **'Reload Screen'**
  String get reload_screen;

  /// No description provided for @want_to_logout.
  ///
  /// In en, this message translates to:
  /// **'Do you want to log out?'**
  String get want_to_logout;

  /// No description provided for @singin_with_phone.
  ///
  /// In en, this message translates to:
  /// **'Sign in with phone number'**
  String get singin_with_phone;

  /// No description provided for @verify_with_phone.
  ///
  /// In en, this message translates to:
  /// **'Verify with phone number'**
  String get verify_with_phone;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @change_email.
  ///
  /// In en, this message translates to:
  /// **'Change Email'**
  String get change_email;

  /// No description provided for @code_will_be_sent.
  ///
  /// In en, this message translates to:
  /// **'A code will be sent to the phone number'**
  String get code_will_be_sent;

  /// No description provided for @continio.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continio;

  /// No description provided for @check.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get check;

  /// No description provided for @code_has_been_sent.
  ///
  /// In en, this message translates to:
  /// **'The code has been sent to your phone number'**
  String get code_has_been_sent;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @enter_pin.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get enter_pin;

  /// No description provided for @enter_number_to_add.
  ///
  /// In en, this message translates to:
  /// **'Enter the number of the friend to be added'**
  String get enter_number_to_add;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @add_friend.
  ///
  /// In en, this message translates to:
  /// **'Add Friend'**
  String get add_friend;

  /// No description provided for @use_strong_pin.
  ///
  /// In en, this message translates to:
  /// **'Use a strong PIN for your account'**
  String get use_strong_pin;

  /// No description provided for @enter_new_pin.
  ///
  /// In en, this message translates to:
  /// **'Enter new PIN'**
  String get enter_new_pin;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @password_error_message.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 digits'**
  String get password_error_message;

  /// No description provided for @phone_error_message.
  ///
  /// In en, this message translates to:
  /// **'Please enter the phone number in the correct format'**
  String get phone_error_message;

  /// No description provided for @errorDuringCommunication.
  ///
  /// In en, this message translates to:
  /// **'Error during communication'**
  String get errorDuringCommunication;

  /// No description provided for @noDataOrContentAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data or content available'**
  String get noDataOrContentAvailable;

  /// No description provided for @invalidRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request'**
  String get invalidRequest;

  /// No description provided for @invalidResponse.
  ///
  /// In en, this message translates to:
  /// **'Invalid response'**
  String get invalidResponse;

  /// No description provided for @unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized'**
  String get unauthorized;

  /// No description provided for @informationNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'The requested information is not available'**
  String get informationNotAvailable;

  /// No description provided for @conflictOccurred.
  ///
  /// In en, this message translates to:
  /// **'A conflict occurred'**
  String get conflictOccurred;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Internal server error'**
  String get internalServerError;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
