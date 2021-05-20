import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:collection/collection.dart' show DeepCollectionEquality;
import 'package:order_repository/src/treatment/models/patient_treatment_product_item_entity.dart'
    show PatientTreatmentProductItemEntity;
import 'package:patient_repository/patient_repository.dart' show Patient;
import 'package:product_repository/product_repository.dart' show Product;

import 'drug_dose_model.dart' show DrugDose, DrugDoseDescription;

class PatientTreatmentProductItem {
  const PatientTreatmentProductItem({
    this.patientTreatmentProductItemID,
    required this.quantity,
    required this.status,
    required this.patient,
    required this.drugDoses,
    required this.product,
  });

  /// Could add reusable assert for status check.

  factory PatientTreatmentProductItem.fromMap(Map<String, dynamic> map) {
    return PatientTreatmentProductItem(
      quantity: map['quantity'] as int,
      status: map['status'] as String,
      patient: Patient.fromMap(map['patient'] as Map<String, dynamic>),
      drugDoses: List<DrugDose>.from(
        (map['drugDoses'] as List<dynamic>?)?.map<DrugDose>(
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

  factory PatientTreatmentProductItem.fromEntity(
    PatientTreatmentProductItemEntity entity,
  ) {
    return PatientTreatmentProductItem(
      quantity: entity.quantity,
      status: entity.status,
      patient: entity.patient,
      drugDoses: entity.drugDoses,
      product: entity.product,
    );
  }

  /// Added ID here due to subcollection concession for simple docID usage
  /// For ostensibly draft orders or editing functionality in the future
  ///
  /// We may not end up using this at all
  ///
  /// Code smell here rather than completely separate read/write model
  /// vs scalable boilerplate
  ///
  /// Null String indicates this is part of a working order being built up
  /// (not from a database read query that has already crystallised committed)
  ///
  final String? patientTreatmentProductItemID;

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

/// Add product description text utility
extension ProductDescription on PatientTreatmentProductItem {
  String getQuantifiedDosedProductText() {
    // Need to rebuild name rules again? Simpler to show per drug dose instead

    final String? drugDosesConcatenatedText = this
        .drugDoses
        ?.map(
          (DrugDose drugDose) => drugDose.getDescriptionText(),
        )
        .join('; ');

    /// Essentially unnoticed if strange error occurs - may be a bad thing
    final String blankedDrugDosesTextTrailingSeparator =
        drugDosesConcatenatedText == null
            ? ''
            : drugDosesConcatenatedText + '; ';

    return 'Qty: ${this.quantity}; '
        '${blankedDrugDosesTextTrailingSeparator}${product.productName}, '
        '${product.administrationRoute}';
  }
}
