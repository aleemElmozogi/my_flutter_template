import 'package:form_validator/form_validator.dart';

class InputValidation {
  static StringValidationCallback requiredValidation() {
    return ValidationBuilder(localeName: 'ar').required().build();
  }

  static StringValidationCallback emailValidation() {
    return ValidationBuilder(localeName: 'ar').email().build();
  }

  static StringValidationCallback notEmptyValidation() {
    return ValidationBuilder(localeName: 'ar')
        .required('يجب ان تتكون كلمة المرور من 8 أرقام على الأقل')
        .build();
  }

  static StringValidationCallback phoneNumberValidation() {
    return ValidationBuilder(localeName: 'ar')
        .regExp(RegExp(r'^9\d{8}$'), 'الرجاء إدخال رقم الهاتف بالصيغة الصحيحة')
        .required('يجب ان لا يكون رقم الهاتف فارغ')
        .build();
  }
}
