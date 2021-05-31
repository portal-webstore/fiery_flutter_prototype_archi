final String doseInvalidValueEmptyInputErrorText =
    'Please enter dose with the given units';
final String doseInvalidValueErrorText =
    'Invalid value detected. Please enter dose';

/// Domain-specific text.
///
/// This should be refactored to another place as it is not a
/// generic numeric input (specifically uses drug dose text)
///
/// Usage
///
/// ```dart
/// TextFormField(
///   validator: doseInputValidator,
/// )
/// ```
String? doseInputValidator(String? input) {
  if (input == null) {
    return doseInvalidValueEmptyInputErrorText;
  }
  final double? doseValue = double.tryParse(input);

  if (doseValue == null) {
    return doseInvalidValueErrorText;
  }

  // Valid numeric dose value
  return null;
}
