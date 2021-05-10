import 'package:flutter/material.dart' show DefaultMaterialLocalizations;

/// Diminishing gains in refactoring this
///
/// Eventually complexity would use localisation string arb files anyway
mixin DateFieldText on DefaultMaterialLocalizations {
  /// We want Australian region date format.
  ///
  /// DefaultMaterialLocalization defaults to mm/dd/yyyy regardless of device
  /// or other setting
  ///
  /// - BUG: https://github.com/flutter/flutter/issues/70341 Known Flutter bug.
  @override
  String get dateHelpText => 'dd/mm/yyyy';

  @override
  String get dateInputLabel => 'Enter date';

  @override
  String get invalidDateFormatLabel => 'Invalid format (dd/MM/yyyy)';
}
