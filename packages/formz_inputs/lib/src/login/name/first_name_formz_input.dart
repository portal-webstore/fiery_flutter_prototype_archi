import 'package:formz/formz.dart' show FormzInput;

enum FirstNameFormzInputValidationError { invalid }

/// No inherent difference of first vs last vs other given names
/// other than localisation and temporal coupling
class FirstNameFormzInput
    extends FormzInput<String, FirstNameFormzInputValidationError> {
  const FirstNameFormzInput.pure() : super.pure('');
  const FirstNameFormzInput.dirty([String value = '']) : super.dirty(value);

  /// Were the positive lookahead spams to allow the partial input like
  /// before and after decimal single dot completed input?
  ///
  static final _FirstNameRegExp = RegExp(
    r"^[A-Za-z \-']{1,}$",
  );

  @override
  FirstNameFormzInputValidationError? validator(String? value) {
    return _FirstNameRegExp.hasMatch(value ?? '')
        ? null
        : FirstNameFormzInputValidationError.invalid;
  }
}
