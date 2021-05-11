import 'package:flutter/material.dart' show DefaultMaterialLocalizations;
import 'package:i18n_l10n_australian/src/localisations/helpers/format_two_zero_pad.dart'
    show formatTwoDigitZeroPad;
import 'package:i18n_l10n_australian/src/localisations/helpers/get_date_string_US_form_from_aus_format.dart'
    show getDateStringUSFormatFromAusFormat;

mixin DateParseFormat on DefaultMaterialLocalizations {
  @override
  String formatCompactDate(DateTime date) {
    // Assumes Aus dd/MM/yyyy rather than US mm/dd/yyyy format
    final day = formatTwoDigitZeroPad(date.day);
    final month = formatTwoDigitZeroPad(date.month);
    final year = date.year.toString().padLeft(4, '0');

    return '$day/$month/$year';
  }

  /// Adapts Australian input and reuses existing format parsers
  /// Check if InputDatePickerFormField form validators use this or other defaults.
  /// e.g. `invalidDateFormatLabel` "Invalid format"
  /// Hack into the default US region functionality
  ///
  /// Return Nullable
  /// No union type support in Dart
  /// Nullable DateTime? notation is in beta.
  @override
  DateTime? parseCompactDate(String? ausInputddMMyyyy) {
    if (ausInputddMMyyyy == null) {
      return null;
    }

    final String? rearrangedAusToUSFormat = getDateStringUSFormatFromAusFormat(
      ausInputddMMyyyy,
    );

    // See tryParse nullability logic in base DefaultMaterialLocalizations
    return super.parseCompactDate(rearrangedAusToUSFormat);
  }
}
