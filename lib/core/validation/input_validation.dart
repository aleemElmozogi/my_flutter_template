import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class InputValidation {
  static StringValidationCallback requiredValidation() {
    return ValidationBuilder().required().build();
  }

  static Future<StringValidationCallback> requiredAmountValidation() async {
    final amountRegex = RegExp(r'^\d+(\.\d{1,2})?$');

    return ValidationBuilder().required().add((value) {
      if (value == null || value.isEmpty) {
        return 'الرجاء إدخال المبلغ';
      }
      if (!amountRegex.hasMatch(value)) return 'صيغة المبلغ غير صحيحة';
      final parsed = double.tryParse(value);
      if (parsed == null) return 'الرجاء إدخال مبلغ صحيح';
      if (parsed <= 0) return 'المبلغ يجب أن يكون أكبر من الصفر';
      return null;
    }).build();
  }

  static StringValidationCallback requiredLimitedAmountValidation(
      double currentBalance) {
    final amountRegex = RegExp(r'^\d+(\.\d{1,2})?$');

    return ValidationBuilder().required().add((value) {
      if (value == null || value.isEmpty) return 'الرجاء إدخال المبلغ';
      if (!amountRegex.hasMatch(value)) return 'صيغة المبلغ غير صحيحة';
      final parsed = double.tryParse(value);
      if (parsed == null) return 'الرجاء إدخال مبلغ صحيح';
      if (parsed > currentBalance) {
        return 'المبلغ يتجاوز الرصيد الحالي ($currentBalance)';
      }
      if (parsed <= 0) return 'المبلغ يجب أن يكون أكبر من الصفر';
      return null;
    }).build();
  }

  static StringValidationCallback emailValidation() {
    return ValidationBuilder().email().build();
  }

  static StringValidationCallback matchValidation(String value) {
    return ValidationBuilder().match(value).required().build();
  }

  static StringValidationCallback passwordValidation() {
    return ValidationBuilder()
        .minLength(8, S.current.passwordErrorMessage)
        .required()
        .build();
  }

  static StringValidationCallback phoneNumberValidation() {
    return ValidationBuilder()
        .regExp(RegExp(r'^9\d{8}$'), S.current.phoneErrorMessage)
        .required()
        .build();
  }

  static StringValidationCallback intRequiredValidation() {
    return ValidationBuilder()
        .required()
        .regExp(RegExp(r'^-?\d+$'), 'يحب تحديد اسم المدينة')
        .build();
  }

  static StringValidationCallback otpValidation() {
    return ValidationBuilder()
        .minLength(6, S.current.otpErrorMessage)
        .required()
        .build();
  }
}
