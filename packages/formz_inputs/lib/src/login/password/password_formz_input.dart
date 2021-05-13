import 'package:formz/formz.dart';

enum PasswordFormzInputValidationError { invalid }

class PasswordFormzInput
    extends FormzInput<String, PasswordFormzInputValidationError> {
  const PasswordFormzInput.pure() : super.pure('');
  const PasswordFormzInput.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordFormzInputValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordFormzInputValidationError.invalid;
  }
}
