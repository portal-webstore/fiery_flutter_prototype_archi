import 'package:intl/intl.dart' show DateFormat;

/// {@template australian_date_locale}
class AustralianDateLocale {
  const AustralianDateLocale._();

  /// 20xx 2021 to 2099
  /// It would be interesting if this software was used for more than a century
  static const String twoDigitYearPrefix = '20';

  /// English (Australia) locale string code
  // ignore: constant_identifier_names
  static const String en_AU = 'en_AU';

  /// Australian human-readable format
  ///
  /// Preferred dd/MM/yyyy
  /// for batch lot item expiries with no day date, MM/yy is often preferred
  ///
  static final DateFormat australianFullDateDisplayFormat = DateFormat(
    'dd/MM/yyyy',
    en_AU,
  );

  /// Get Universal Zulu string time for minimal ambiguity
  ///
  /// Note that Dart datetime toIso8601String only returns Z when *explicitly*
  /// converted to UTC time.
  ///
  /// Otherwise it conforms to another format:
  /// **No trailing 'Z'** suffix for non-UTC local time; does not show offset!
  /// ^ Which could potentially lead to buggy behaviour.
  static String getIso8601ZStringFromDateTime(DateTime datetime) {
    return datetime.toUtc().toIso8601String();
  }
}
