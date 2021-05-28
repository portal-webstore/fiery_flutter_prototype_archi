import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, DocumentSnapshot;
import 'package:order_repository/order_repository.dart' show DrugDose;
import 'package:order_repository/src/treatment/models/get_drug_doses_from_map_list.dart'
    show getDrugDosesParsedFromDynamicList;
import 'package:patient_repository/patient_repository.dart' show Patient;
import 'package:product_repository/product_repository.dart' show Product;

class PatientTreatmentProductItemEntity {
  const PatientTreatmentProductItemEntity({
    required this.quantity,
    required this.status,
    required this.patient,
    required this.drugDoses,
    required this.product,

    /// Confusing generator not sure the convention the author is adhering to.
    required this.snapshot,
    required this.reference,
    required this.patientTreatmentProductItemID,
  });

  /// Alias in keeping with sample for maintainability.
  factory PatientTreatmentProductItemEntity.fromSnapshot(
    DocumentSnapshot snapshot,
  ) =>
      PatientTreatmentProductItemEntity.fromFirestore(
        snapshot,
      );

  factory PatientTreatmentProductItemEntity.fromFirestore(
    DocumentSnapshot snapshot,
  ) {
    final Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;

    if (map['patient'] == null ||
        map['drugDoses'] == null ||
        map['product'] == null) {
      throw FormatException(
        'Found null for a parsed field instead of Map object or List',
      );
    }

    final Patient patient = Patient.fromMap(
      map['patient'] as Map<String, dynamic>,
    );
    final List<DrugDose> drugDoses = getDrugDosesParsedFromDynamicList(
      /// Must be List<dynamic> to allow parsing
      /// Must not be List<Map<String, dynamic>> as it results in error.
      map['drugDoses'] as List<dynamic>,
    );
    final Product product = Product.fromMap(
      map['product'] as Map<String, dynamic>,
    );

    return PatientTreatmentProductItemEntity(
      quantity: (map['quantity'] as num).toInt(),
      status: map['status'] as String,
      patient: patient,
      drugDoses: drugDoses,
      product: product,
      snapshot: snapshot,
      reference: snapshot.reference,
      patientTreatmentProductItemID: snapshot.id,
    );
  }

  final int quantity;
  final String status;
  final Patient patient;
  final List<DrugDose> drugDoses;
  final Product product;

  /// Confusing firestore data class generator
  final DocumentSnapshot? snapshot;
  final DocumentReference? reference;
  final String? patientTreatmentProductItemID;
  Map<String, dynamic> toMap() => <String, dynamic>{
        'quantity': quantity,
        'status': status,
        'patient': patient.toMap(),
        'drugDoses': drugDoses.map((x) => x.toMap()).toList(),
        'product': product.toMap(),
      };

  /// Note that there is no ID on creating a new Firestore document
  /// Firestore handles and creates an autoID itself.
  ///
  Map<String, dynamic> toDocument() => toMap();

  PatientTreatmentProductItemEntity copyWith({
    int? quantity,
    String? status,
    Patient? patient,
    List<DrugDose>? drugDoses,
    Product? product,
  }) {
    return PatientTreatmentProductItemEntity(
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      patient: patient ?? this.patient,
      drugDoses: drugDoses ?? this.drugDoses,
      product: product ?? this.product,
      //
      reference: reference,
      snapshot: snapshot,
      patientTreatmentProductItemID: patientTreatmentProductItemID,
    );
  }

  @override
  String toString() {
    return '${quantity.toString()}, ${status.toString()}, ${patient.toString()}, ${drugDoses.toString()}, ${product.toString()}, ';
  }

  /// Buggy generator predicated on having non-null cloud_firestore fields
  /// When they are nullable in the generated class factories.
  @override
  bool operator ==(other) =>
      other is PatientTreatmentProductItemEntity &&
      patientTreatmentProductItemID == other.patientTreatmentProductItemID;

  int get hashCode => patientTreatmentProductItemID.hashCode;
}
