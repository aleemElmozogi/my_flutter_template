// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحبا بالعالم!';

  @override
  String get appName => 'كتّاب';

  @override
  String get opps => 'عفواً !';

  @override
  String get internetConnectionError =>
      'من فضلك أفحص اتصالك بالانترنت ، وأعد المحاولة';

  @override
  String get tryAgain => 'حاول مجدداَ';

  @override
  String get welcome => 'أهلًا بك';

  @override
  String get agree => 'حسنًا';

  @override
  String get ok => 'موافق';

  @override
  String get cancel => 'إلغاء';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get qrParsingError => 'حدث خطأ أثناء تجهيز رمز الQR';

  @override
  String get reloadScreen => 'إعادة تحميل الصفحة';

  @override
  String get wantToLogout => 'هل تريد تسجيل الخروج؟';

  @override
  String get signinWithPhone => 'تسجيل الدخول برقم الهاتف';

  @override
  String get verifyWithPhone => 'التحقق من رقم الهاتف';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get changeEmail => 'تغيير البريد الإلكتروني';

  @override
  String get codeWillBeSent => 'سيتم إرسال رمز إلى رقم الهاتف';

  @override
  String get continio => 'Continue';

  @override
  String get check => 'تحقق';

  @override
  String get codeHasBeenSent => 'تم إرسال الرمز إلى رقم هاتفك';

  @override
  String get resend => 'أعد الإرسال';

  @override
  String get enterPin => 'أدخل رمز التعريف الشخصي';

  @override
  String get enterNumberToAdd => 'أدخل رقم الصديق المراد إضافته';

  @override
  String get save => 'حفظ';

  @override
  String get addFriend => 'إضافة صديق';

  @override
  String get useStrongPin => 'إستخدم رمز تعريف شخصي قوي لحسابك';

  @override
  String get enterNewPin => 'أدخل رمز التعريف الشخصي الجديد';

  @override
  String get logout => 'تسجيل خروج';

  @override
  String get passwordErrorMessage =>
      'يجب ان تتكون كلمة المرور من 8 أرقام على الأقل';

  @override
  String get phoneErrorMessage => 'الرجاء إدخال رقم الهاتف بالصيغة الصحيحة';

  @override
  String get errorDuringCommunication => 'خطأ أثناء التواصل';

  @override
  String get noDataOrContentAvailable => 'لا يوجد بيانات أو محتوى متاح';

  @override
  String get invalidRequest => 'طلب غير صالح';

  @override
  String get invalidResponse => 'استجابة غير صالحة';

  @override
  String get unauthorized => 'غير مصرح به';

  @override
  String get informationNotAvailable => 'المعلومات المطلوبة غير موجودة';

  @override
  String get conflictOccurred => 'حدث تضارب';

  @override
  String get internalServerError => 'خطأ داخلي في الخادم';

  @override
  String get noInternetConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get otpErrorMessage => 'الرجاء التأكد من كتابة رمز الـOTP بشكل صحيح';

  @override
  String get accountNotActive => 'هذا الحساب غير مفعل بعد.';

  @override
  String get passwordResetRequired =>
      'يجب إعادة تعيين كلمة المرور قبل تسجيل الدخول.';

  @override
  String get missingAccountState => 'حالة الحساب غير موجودة في استجابة الخادم.';

  @override
  String get missingUserProfile => 'ملف المستخدم غير موجود في استجابة الخادم.';
}
