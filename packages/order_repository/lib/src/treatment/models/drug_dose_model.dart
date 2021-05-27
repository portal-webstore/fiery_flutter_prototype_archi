import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:drug_repository/drug_repository.dart' show Drug;

/// - FIXME: Fundamental deviation in ERD here.
/// Make sure Firestore is consistent
/// are we flattening drugName drugUnitsOfMeasurement ocsDrugLink here?
/// We have passed in a Drug map into the DrugDose converter..
class DrugDose {
  const DrugDose({
    required this.drug,
    required this.dose,
  });

  factory DrugDose.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      throw FormatException('Weird error null drugDose map when not');
    }
    if (map['drug'] == null) {
      throw FormatException('Weird error null drugDose.drug');
    }
    if (map['dose'] == null) {
      throw FormatException('Weird error null drugDose.dose');
    }
    return DrugDose(
      drug: Drug.fromMap(map['drug'] as Map<String, dynamic>),
      dose: (map['dose'] as num).toDouble(),
    );
  }

  factory DrugDose.fromJson(String source) =>
      DrugDose.fromMap(jsonDecode(source) as Map<String, dynamic>);

  final Drug drug;
  final double dose;

  DrugDose copyWith({
    Drug? drug,
    double? dose,
  }) {
    return DrugDose(
      drug: drug ?? this.drug,
      dose: dose ?? this.dose,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'drug': drug.toMap(),
      'dose': dose.toDouble(),
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'DrugDose(drug: $drug, dose: $dose)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DrugDose && other.drug == drug && other.dose == dose;
  }

  @override
  int get hashCode => drug.hashCode ^ dose.hashCode;
}

extension DrugDoseDescription on DrugDose {
  String getDescriptionText() {
    return '${this.drug.drugName}: '
        '${this.dose}${this.drug.drugUnitsOfMeasurement}';
  }
}
