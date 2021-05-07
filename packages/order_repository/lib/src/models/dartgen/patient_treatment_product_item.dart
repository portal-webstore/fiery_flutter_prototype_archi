import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:collection/collection.dart' show DeepCollectionEquality;

import 'drug_dose.dart' show DrugDose;
import 'patient.dart' show Patient;
import 'product.dart' show Product;

class PatientTreatmentProductItem {
  const PatientTreatmentProductItem({
    required this.quantity,
    required this.status,
    required this.patient,
    required this.drugDoses,
    required this.product,
  });

  factory PatientTreatmentProductItem.fromMap(Map<String, dynamic> map) {
    return PatientTreatmentProductItem(
      quantity: map['quantity'] as int,
      status: map['status'] as String,
      patient: Patient.fromMap(map['patient'] as Map<String, dynamic>),
      drugDoses: List<DrugDose>.from(
        (map['drugDoses'] as Iterable<Map<String, dynamic>>?)?.map<DrugDose>(
              (dynamic x) => DrugDose.fromMap(
                x as Map<String, dynamic>,
              ),
            ) ??
            <DrugDose>[],
      ),
      product: Product.fromMap(map['product'] as Map<String, dynamic>),
    );
  }

  factory PatientTreatmentProductItem.fromJson(String source) =>
      PatientTreatmentProductItem.fromMap(
        jsonDecode(source) as Map<String, dynamic>,
      );

  final int quantity;
  final String status;
  final Patient patient;
  final List<DrugDose>? drugDoses;
  final Product product;

  PatientTreatmentProductItem copyWith({
    int? quantity,
    String? status,
    Patient? patient,
    List<DrugDose>? drugDoses,
    Product? product,
  }) {
    return PatientTreatmentProductItem(
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      patient: patient ?? this.patient,
      drugDoses: drugDoses ?? this.drugDoses,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quantity': quantity,
      'status': status,
      'patient': patient.toMap(),
      'drugDoses': drugDoses?.map((x) => x.toMap()).toList(),
      'product': product.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'PatientTreatmentProductItem(quantity: $quantity, status: $status, patient: $patient, drugDoses: $drugDoses, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is PatientTreatmentProductItem &&
        other.quantity == quantity &&
        other.status == status &&
        other.patient == patient &&
        listEquals(other.drugDoses, drugDoses) &&
        other.product == product;
  }

  @override
  int get hashCode {
    return quantity.hashCode ^
        status.hashCode ^
        patient.hashCode ^
        drugDoses.hashCode ^
        product.hashCode;
  }
}
