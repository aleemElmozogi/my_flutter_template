import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class InputValidation {
  static final RegExp _libyanPhoneRegex = RegExp(r'^(\+218|218|0)?9\d{8}$');

  static StringValidationCallback requiredValidation() {
    return ValidationBuilder().required().build();
  }

  static StringValidationCallback emailValidation() {
    return ValidationBuilder().email().build();
  }

  static StringValidationCallback passwordValidation() {
    return ValidationBuilder()
        .minLength(8, S.current.phoneErrorMessage)
        .required()
        .build();
  }

  static StringValidationCallback phoneNumberValidation() {
    return ValidationBuilder()
        .add((value) {
      if (value == null || value.trim().isEmpty) {
        return S.current.phoneErrorMessage;
      }

      final normalized = value.replaceAll(' ', '');
      if (!_libyanPhoneRegex.hasMatch(normalized)) {
        return S.current.phoneErrorMessage;
      }
      return null;
    })
        .required()
        .build();
  }

  static StringValidationCallback nameValidation() {
    return ValidationBuilder()
        .required('الاسم مطلوب')
        .minLength(3, 'الاسم يجب أن يكون 3 أحرف على الأقل')
        .maxLength(50, 'الاسم طويل جدًا')
        .add((value) {
      final input = value?.trim() ?? '';
      if (input.isEmpty) return 'الاسم مطلوب';
      if (!RegExp(r'^[\u0600-\u06FFa-zA-Z\s]+$').hasMatch(input)) {
        return 'الاسم يجب أن يحتوي على حروف فقط';
      }
      return null;
    })
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
        .minLength(6, 'S.current.otpErrorMessage')
        .required()
        .build();
  }
}
