import 'package:formz/formz.dart' show FormzInput;

enum LastNameFormzInputValidationError { invalid }

/// No inherent difference of Last vs last vs other given names
/// other than localisation and temporal coupling
class LastNameFormzInput
    extends FormzInput<String, LastNameFormzInputValidationError> {
  const LastNameFormzInput.pure() : super.pure('');
  const LastNameFormzInput.dirty([String value = '']) : super.dirty(value);

  static final _LastNameRegExp = RegExp(
    r"^[A-Za-z \-']{1,}$",
  );

  @override
  LastNameFormzInputValidationError? validator(String? value) {
    return _LastNameRegExp.hasMatch(value ?? '')
        ? null
        : LastNameFormzInputValidationError.invalid;
  }
}
