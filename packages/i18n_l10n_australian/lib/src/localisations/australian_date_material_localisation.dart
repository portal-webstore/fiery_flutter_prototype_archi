import 'package:flutter/material.dart' show DefaultMaterialLocalizations;
import 'package:i18n_l10n_australian/src/localisations/mixins/date_field_text.dart'
    show DateFieldText;
import 'package:i18n_l10n_australian/src/localisations/mixins/date_parse_format.dart'
    show DateParseFormat;

/// Override default date helper text display, parsing formatting
///
///
/// Default MaterialApp implicitly uses DefaultMaterialLocalizations delegate
///
/// We are now forcing our own delegate instead.
///
/// Override samples found here
/// https://stackoverflow.com/questions/54518741/flutter-change-search-hint-text-of-searchdelegate
/// - BUG: https://github.com/flutter/flutter/issues/70341
/// Repurpose to override the dateHelpText for date mm/dd/yyyy
class AustralianDateMaterialLocalisation extends DefaultMaterialLocalizations
    with DateFieldText, DateParseFormat {
  const AustralianDateMaterialLocalisation();
}
