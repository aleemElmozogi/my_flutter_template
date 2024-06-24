import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:my_flutter_template/generated/l10n.dart';

class InputValidation {
  static StringValidationCallback requiredValidation() {
    return ValidationBuilder().required().build();
  }

  static StringValidationCallback emailValidation() {
    return ValidationBuilder().email().build();
  }

  static StringValidationCallback passwordValidation() {
    return ValidationBuilder()
        .minLength(8, S.current.password_error_message)
        .required()
        .build();
  }

  static StringValidationCallback phoneNumberValidation() {
    return ValidationBuilder()
        .regExp(RegExp(r'^9\d{8}$'), S.current.phone_error_message)
        .required()
        .build();
  }
}
