import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart'
    show Locale, LocalizationsDelegate, MaterialLocalizations;
import 'package:i18n_l10n_australian/src/localisations/australian_date_material_localisation.dart'
    show AustralianDateMaterialLocalisation;

class AustralianAppLocalisationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const AustralianAppLocalisationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      SynchronousFuture<MaterialLocalizations>(
        const AustralianDateMaterialLocalisation(),
      );

  @override
  bool shouldReload(AustralianAppLocalisationDelegate old) => false;

  @override
  String toString() => 'CustomLocalization.delegate(en_AU)';
}
