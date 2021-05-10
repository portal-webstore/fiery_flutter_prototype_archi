/// Simply reuse the default material localization United States logic
/// Rather than recreating implementations.
///
/// Though likely wouldn't expect implementation to be fragile to much politics
/// anyway
///
/// Ease of testing blast coverage.
String? getDateStringUSFormatFromAusFormat(String ausInputddMMyyyy) {
  final List<String> dateParts = ausInputddMMyyyy.split('/');
  if (dateParts.length != 3) {
    return null;
  }
  final String day = dateParts[0];
  final String month = dateParts[1];
  final String year = dateParts[2];

  // To reuse the default US logic rather than recreating
  // This will break if Flutter ever decides to have respective region defaults.
  final String rearrangedAusToUSFormat = '$month/$day/$year';

  return rearrangedAusToUSFormat;
}
