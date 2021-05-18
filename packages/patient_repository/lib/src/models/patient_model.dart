import 'dart:convert' show jsonDecode, jsonEncode;

class Patient {
  const Patient({
    required this.patientIdentifier,
    required this.lastName,
    required this.firstName,
    required this.birthDate,
    required this.patientOcsLink,
  });

  /// Convert from a **queried** json map with no optionals.
  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      patientIdentifier: map['patientIdentifier'] as String,
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      birthDate: map['birthDate'] as String,

      /// OCS-scraped patients should have mandatory ocs link id field.
      patientOcsLink: map['patientOcsLink'] as int,
    );
  }

  factory Patient.fromJson(String source) =>
      Patient.fromMap(jsonDecode(source) as Map<String, dynamic>);

  final String patientIdentifier;
  final String lastName;
  final String firstName;
  final String birthDate;

  /// Optional to allow for model reuse when a free-text patient is desired
  /// Rather than querying existing
  final int? patientOcsLink;

  Patient copyWith({
    String? patientIdentifier,
    String? lastName,
    String? firstName,
    String? birthDate,
    int? patientOcsLink,
  }) {
    return Patient(
      patientIdentifier: patientIdentifier ?? this.patientIdentifier,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      birthDate: birthDate ?? this.birthDate,
      patientOcsLink: patientOcsLink ?? this.patientOcsLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patientIdentifier': patientIdentifier,
      'lastName': lastName,
      'firstName': firstName,
      'birthDate': birthDate,
      'patientOcsLink': patientOcsLink,
    };
  }

  String toJson() => jsonEncode(toMap());
  @override
  String toString() {
    return 'Patient(patientIdentifier: $patientIdentifier, lastName: $lastName, firstName: $firstName, birthDate: $birthDate, patientOcsLink: $patientOcsLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Patient &&
        other.patientIdentifier == patientIdentifier &&
        other.lastName == lastName &&
        other.firstName == firstName &&
        other.birthDate == birthDate &&
        other.patientOcsLink == patientOcsLink;
  }

  @override
  int get hashCode {
    return patientIdentifier.hashCode ^
        lastName.hashCode ^
        firstName.hashCode ^
        birthDate.hashCode ^
        patientOcsLink.hashCode;
  }
}
