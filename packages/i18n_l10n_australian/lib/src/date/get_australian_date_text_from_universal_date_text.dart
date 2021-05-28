import 'package:i18n_l10n_australian/i18n_l10n_australian.dart'
    show AustralianDateLocale;
import 'package:intl/intl.dart' show DateFormat;

final DateFormat universalDateFormat = DateFormat('yyyy-MM-dd');

String getAustralianDateTextFromUniversalDateText(String universalDate) {
  final DateTime date = universalDateFormat.parseStrict(universalDate);

  final String australianDateText =
      AustralianDateLocale.australianFullDateDisplayFormat.format(
    date,
  );

  return australianDateText;
}
