import 'dart:convert' show json;

/// {@template drug_model}
/// Drug name units model ported from ocs scrape.
/// {@endtemplate}
class Drug {
  const Drug({
    required this.drugName,
    required this.drugUnits,
    required this.ocsDrugLink,
  });

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      drugName: map['drugName'] as String,
      drugUnits: map['drugUnits'] as String,
      ocsDrugLink: map['ocsDrugLink'] as int,
    );
  }

  factory Drug.fromJson(String source) => Drug.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String drugName;
  final String drugUnits;
  final int ocsDrugLink;

  Drug copyWith({
    String? drugName,
    String? drugUnits,
    int? ocsDrugLink,
  }) {
    return Drug(
      drugName: drugName ?? this.drugName,
      drugUnits: drugUnits ?? this.drugUnits,
      ocsDrugLink: ocsDrugLink ?? this.ocsDrugLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'drugName': drugName,
      'drugUnits': drugUnits,
      'ocsDrugLink': ocsDrugLink,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'Drug(drugName: $drugName, drugUnits: $drugUnits, ocsDrugLink: $ocsDrugLink)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Drug &&
        other.drugName == drugName &&
        other.drugUnits == drugUnits &&
        other.ocsDrugLink == ocsDrugLink;
  }

  @override
  int get hashCode =>
      drugName.hashCode ^ drugUnits.hashCode ^ ocsDrugLink.hashCode;
}
