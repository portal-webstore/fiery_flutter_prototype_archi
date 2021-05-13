import 'package:formz/formz.dart';

enum ConfirmedPasswordFormzInputValidationError { invalid }

class ConfirmedPasswordFormzInput
    extends FormzInput<String, ConfirmedPasswordFormzInputValidationError> {
  const ConfirmedPasswordFormzInput.pure({this.password = ''}) : super.pure('');
  const ConfirmedPasswordFormzInput.dirty(
      {required this.password, String value = ''})
      : super.dirty(value);

  final String password;

  @override
  ConfirmedPasswordFormzInputValidationError? validator(String? value) {
    return password == value
        ? null
        : ConfirmedPasswordFormzInputValidationError.invalid;
  }
}
