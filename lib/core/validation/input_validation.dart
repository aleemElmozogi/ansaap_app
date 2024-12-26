import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:ansaap_app/generated/l10n.dart';

class InputValidation {
  static StringValidationCallback requiredValidation() {
    return ValidationBuilder().required().build();
  }

  static StringValidationCallback userName() {
    return ValidationBuilder()
        .regExp(
            RegExp(r'^[a-zA-Z0-9._]+$'), 'يرجى إدخال إسم المستخدم بصيغة صحيحة')
        .required()
        .build();
  }

  static StringValidationCallback emailValidation() {
    return ValidationBuilder().email().build();
  }

  static StringValidationCallback matchValidation(String value) {
    return ValidationBuilder().required().match(value).build();
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

  static StringValidationCallback otpValidation() {
    return ValidationBuilder()
        .minLength(6, S.current.otpErrorMessage)
        .required()
        .build();
  }
}
