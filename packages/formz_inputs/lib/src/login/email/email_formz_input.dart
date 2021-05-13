import 'package:formz/formz.dart';

enum EmailFormzInputValidationError { invalid }

class EmailFormzInput
    extends FormzInput<String, EmailFormzInputValidationError> {
  const EmailFormzInput.pure() : super.pure('');
  const EmailFormzInput.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
  );

  @override
  EmailFormzInputValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailFormzInputValidationError.invalid;
  }
}
