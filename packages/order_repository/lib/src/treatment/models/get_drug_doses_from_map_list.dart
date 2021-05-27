import 'package:order_repository/order_repository.dart' show DrugDose;

/// For internal repository models package usage Firestore map conversions
///
/// The clinic nurse customer given drug doses as part of adding drug (products)
/// to an order
///
/// Co-meshed the ad hoc drug choice with the dose value
/// or co-meshed a queried predetermined product.drugs fields with dose value
///
/// Most will only have one element.
///
/// Should have at least one drug dose to be valid
///
/// For factory constructor conversions from Firestore into Entity model
/// Usage:
/// ```dart
///   getDrugDosesParsedFromDynamicList(map['drugDoses'] as List<dynamic>)
/// ```
/// Attempts to parse untyped map field
///
///
/// Returns empty list on null
List<DrugDose> getDrugDosesParsedFromDynamicList(
  List<dynamic>? drugDoseMaps,
) {
  final Iterable<DrugDose> drugDosesIterable = drugDoseMaps?.map<DrugDose>(
        _getDrugDoseFromDynamicMap,
      ) ??
      [];

  return drugDosesIterable.toList();
}

DrugDose _getDrugDoseFromDynamicMap(dynamic drugMap) {
  if (drugMap == null) {
    print('weird null');
  }

  final Map<String, dynamic> map = drugMap as Map<String, dynamic>;
  return DrugDose.fromMap(
    map,
  );
}
