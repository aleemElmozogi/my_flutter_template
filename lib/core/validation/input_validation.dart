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
        return S.current.amountRequired;
      }
      if (!amountRegex.hasMatch(value)) return S.current.invalidAmountFormat;
      final parsed = double.tryParse(value);
      if (parsed == null) return S.current.validAmountRequired;
      if (parsed <= 0) return S.current.amountMustBePositive;
      return null;
    }).build();
  }

  static StringValidationCallback requiredLimitedAmountValidation(
    double currentBalance,
  ) {
    final amountRegex = RegExp(r'^\d+(\.\d{1,2})?$');

    return ValidationBuilder().required().add((value) {
      if (value == null || value.isEmpty) return S.current.amountRequired;
      if (!amountRegex.hasMatch(value)) return S.current.invalidAmountFormat;
      final parsed = double.tryParse(value);
      if (parsed == null) return S.current.validAmountRequired;
      if (parsed > currentBalance) {
        return S.current.amountExceedsCurrentBalance(currentBalance.toString());
      }
      if (parsed <= 0) return S.current.amountMustBePositive;
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
        .regExp(RegExp(r'^-?\d+$'), S.current.cityNameRequired)
        .build();
  }

  static StringValidationCallback otpValidation() {
    return ValidationBuilder()
        .minLength(6, S.current.otpErrorMessage)
        .required()
        .build();
  }
}
