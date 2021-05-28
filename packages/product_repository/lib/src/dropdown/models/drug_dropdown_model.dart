import 'dart:convert' show json;

import 'package:equatable/equatable.dart' show Equatable;

/// Drug dropdown model for dropdown-assistive free text
class DrugDropdown extends Equatable {
  const DrugDropdown({
    required this.drugName,
    required this.drugUnitsOfMeasurement,
    required this.ocsDrugLink,
  });

  factory DrugDropdown.fromMap(Map<String, dynamic> map) {
    return DrugDropdown(
      drugName: map['drugName'] as String? ?? '',
      drugUnitsOfMeasurement: map['drugUnitsOfMeasurement'] as String? ?? '',
      ocsDrugLink: (map['ocsDrugLink'] as num?)?.toInt() ?? -1,
    );
  }
  factory DrugDropdown.fromJson(String source) =>
      DrugDropdown.fromMap(json.decode(source) as Map<String, dynamic>);

  final String drugName;
  final String drugUnitsOfMeasurement;
  final int ocsDrugLink;
  DrugDropdown copyWith({
    String? drugName,
    String? drugUnitsOfMeasurement,
    int? ocsDrugLink,
  }) {
    return DrugDropdown(
      drugName: drugName ?? this.drugName,
      drugUnitsOfMeasurement:
          drugUnitsOfMeasurement ?? this.drugUnitsOfMeasurement,
      ocsDrugLink: ocsDrugLink ?? this.ocsDrugLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'drugName': drugName,
      'drugUnitsOfMeasurement': drugUnitsOfMeasurement,
      'ocsDrugLink': ocsDrugLink,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [drugName, drugUnitsOfMeasurement, ocsDrugLink];
}
