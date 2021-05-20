import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, DocumentSnapshot;
import 'package:order_repository/src/treatment/models/models.dart';

class OrderEntity {
  const OrderEntity({
    this.orderID,
    this.orderReference,
    this.createdAt,
    this.updatedAt,
    this.requiredByDeliveryDate,
    this.comments,
    this.isDraft,
    this.patientTreatmentProductItems,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory OrderEntity.fromFirestore(DocumentSnapshot snapshot) {
    final Map<String, Object?> map = snapshot.data() as Map<String, Object?>;

    if (map['patientTreatmentProductItems'] == null) {
      throw FormatException(
        'Expected patient treatment product items maps in a list. '
        'Please check data store or conversion adaptors and try again',
      );
    }

    /// Dart runtime type as List<dynamic> ...
    /// Bugs out if we cast List<Map<String, Object?>>
    /// In Dart, the element type of a list is provided when the list is created,
    /// See explanation https://stackoverflow.com/a/55577750
    /// The list is set by the json parser at time of parse (API upstream to us)
    final List<dynamic> patientTreatmentProductMaps =
        map['patientTreatmentProductItems'] as List<dynamic>;

    final List<PatientTreatmentProductItem> patientTreatmentProductItems =
        getListPatientTreatmentProductsFromFirestoreJsonMaps(
      patientTreatmentProductMaps,
    );

    return OrderEntity(
      orderID: map['orderID'] != null ? map['orderID'] as String : null,
      orderReference: map['orderReference'] != null
          ? map['orderReference'] as String
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as int : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as int : null,
      requiredByDeliveryDate: map['requiredByDeliveryDate'] != null
          ? map['requiredByDeliveryDate'] as String
          : null,
      comments: map['comments'] != null ? map['comments'] as String : null,
      isDraft: map['isDraft'] != null ? map['isDraft'] as bool : null,
      patientTreatmentProductItems: patientTreatmentProductItems,
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  /// Alias in keeping with sample for maintainability.
  factory OrderEntity.fromSnapshot(DocumentSnapshot snapshot) =>
      OrderEntity.fromFirestore(snapshot);

  /// Note that (flutter)firestore document snapshot data maps list as <dynamic>
  /// Runtime type List<dynamic> is kept part of the list value
  /// Even though we only want it for readonly purposes
  static List<PatientTreatmentProductItem>
      getListPatientTreatmentProductsFromFirestoreJsonMaps(
    List<dynamic>? patientTreatmentProductsMappedFromSnapshot,
  ) {
    final List<dynamic> blankedList =
        patientTreatmentProductsMappedFromSnapshot ?? <Map<String, Object?>>[];

    final List<PatientTreatmentProductItem>
        objectifiedPatientTreatmentProducts =
        blankedList.map<PatientTreatmentProductItem>(
      (
        dynamic productItemMap,
      ) {
        // We finally coerce the map type information here from dynamic
        return PatientTreatmentProductItem.fromMap(
            productItemMap as Map<String, Object?>);
      },
    ).toList();

    return objectifiedPatientTreatmentProducts;
  }

  factory OrderEntity.fromMap(Map<String, dynamic> map) {
    return OrderEntity(
      orderID: map['orderID'] != null ? map['orderID'] as String : null,
      orderReference: map['orderReference'] != null
          ? map['orderReference'] as String
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as int : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as int : null,
      requiredByDeliveryDate: map['requiredByDeliveryDate'] != null
          ? map['requiredByDeliveryDate'] as String
          : null,
      comments: map['comments'] != null ? map['comments'] as String : null,
      isDraft: map['isDraft'] != null ? map['isDraft'] as bool : null,
    );
  }

  final String? orderID;
  final String? orderReference;
  final int? createdAt;
  final int? updatedAt;
  final String? requiredByDeliveryDate;
  final String? comments;
  final bool? isDraft;
  final List<PatientTreatmentProductItem>? patientTreatmentProductItems;
  final DocumentSnapshot? snapshot;
  final DocumentReference? reference;

  /// Generated.
  /// DocumentID should be resolved into orderID instead.
  final String? documentID;

  Map<String, dynamic> toMap() {
    final Map<String, Object?> map = {
      'orderID': orderID,
      'orderReference': orderReference,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'requiredByDeliveryDate': requiredByDeliveryDate,
      'comments': comments,
      'isDraft': isDraft,
      'patientTreatmentProductItems':
          _getPatientTreatmentProductItemsMappedList(),
    };

    return map;
  }

  /// Per Firestore sample
  Map<String, Object?> toDocument() {
    return {
      'orderReference': orderReference,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'requiredByDeliveryDate': requiredByDeliveryDate,
      'comments': comments,
      'isDraft': isDraft,
      'patientTreatmentProductItems':
          _getPatientTreatmentProductItemsMappedList(),
    };
  }

  OrderEntity copyWith({
    String? orderID,
    String? orderReference,
    int? createdAt,
    int? updatedAt,
    String? requiredByDeliveryDate,
    String? comments,
    bool? isDraft,
  }) {
    return OrderEntity(
      orderID: orderID ?? this.orderID,
      orderReference: orderReference ?? this.orderReference,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      requiredByDeliveryDate:
          requiredByDeliveryDate ?? this.requiredByDeliveryDate,
      comments: comments ?? this.comments,
      isDraft: isDraft ?? this.isDraft,
    );
  }

  @override
  String toString() {
    return '${orderID.toString()}, '
        '${orderReference.toString()}, '
        '${createdAt.toString()}, '
        '${updatedAt.toString()}, '
        '${requiredByDeliveryDate.toString()}, '
        '${comments.toString()}, '
        '${isDraft.toString()}, ';
  }

  /// These are not good enough. Only good for query model
  ///
  @override
  bool operator ==(other) =>
      other is OrderEntity && documentID == other.documentID;

  int get hashCode => documentID.hashCode;

  List<Map<String, dynamic>> _getPatientTreatmentProductItemsMappedList() {
    return patientTreatmentProductItems
            ?.map(
              (e) => e.toMap(),
            )
            .toList() ??
        <Map<String, dynamic>>[];
  }
}
