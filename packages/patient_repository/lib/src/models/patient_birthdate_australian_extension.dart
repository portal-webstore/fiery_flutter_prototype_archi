import 'package:i18n_l10n_australian/i18n_l10n_australian.dart';
import 'package:patient_repository/src/models/patient_model.dart' show Patient;

/// {@template patient_birthdate_australian_extension}
/// Extension to convert from universal yyyy-MM-dd to local dd/MM/yyyy
/// {@endtemplate}
extension PatientBirthDateAustralian on Patient {
  /// {@macro patient_birthdate_australian_extension}
  String get birthDateAus {
    return getAustralianDateTextFromUniversalDateText(this.birthDate);
  }

  String getNameTextFromPatient() {
    return '${this.lastName}, ${this.firstName} '
        '(${this.birthDateAus}) '
        '${this.patientIdentifier}';
  }
}
