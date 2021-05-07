import 'dart:convert';

import 'ocs_drug_link.dart';

class Drug {
  final String drugName;
  final String drugUnitsOfMeasurement;
  final OcsDrugLink ocsDrugLink;
  Drug({
    required this.drugName,
    required this.drugUnitsOfMeasurement,
    required this.ocsDrugLink,
  });

  Drug copyWith({
    String? drugName,
    String? drugUnitsOfMeasurement,
    OcsDrugLink? ocsDrugLink,
  }) {
    return Drug(
      drugName: drugName ?? this.drugName,
      drugUnitsOfMeasurement: drugUnitsOfMeasurement ?? this.drugUnitsOfMeasurement,
      ocsDrugLink: ocsDrugLink ?? this.ocsDrugLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drugName': drugName,
      'drugUnitsOfMeasurement': drugUnitsOfMeasurement,
      'ocsDrugLink': ocsDrugLink.toMap(),
    };
  }

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      drugName: map['drugName'],
      drugUnitsOfMeasurement: map['drugUnitsOfMeasurement'],
      ocsDrugLink: OcsDrugLink.fromMap(map['ocsDrugLink']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Drug.fromJson(String source) => Drug.fromMap(json.decode(source));

  @override
  String toString() => 'Drug(drugName: $drugName, drugUnitsOfMeasurement: $drugUnitsOfMeasurement, ocsDrugLink: $ocsDrugLink)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Drug &&
      other.drugName == drugName &&
      other.drugUnitsOfMeasurement == drugUnitsOfMeasurement &&
      other.ocsDrugLink == ocsDrugLink;
  }

  @override
  int get hashCode => drugName.hashCode ^ drugUnitsOfMeasurement.hashCode ^ ocsDrugLink.hashCode;
}