import 'dart:convert';

import 'drug.dart';

class DrugDose {
  final Drug drug;
  final double dose;
  DrugDose({
    required this.drug,
    required this.dose,
  });

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

  factory DrugDose.fromMap(Map<String, dynamic> map) {
    return DrugDose(
      drug: Drug.fromMap(map['drug'] as Map<String, dynamic>),
      dose: (map['dose'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DrugDose.fromJson(String source) =>
      DrugDose.fromMap(jsonDecode(source) as Map<String, dynamic>);

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
