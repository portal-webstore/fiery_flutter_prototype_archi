import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:collection/collection.dart' show DeepCollectionEquality;
import 'package:order_repository/order_repository.dart';
import 'package:order_repository/src/treatment/models/patient_treatment_product_item_model.dart'
    show PatientTreatmentProductItem;

class Order {
  const Order({
    required this.orderID,
    required this.orderReference,
    required this.createdAt,
    required this.updatedAt,
    required this.requiredByDeliveryDate,
    required this.comments,
    required this.isDraft,
    required this.patientTreatmentProductItems,
  });

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderID: map['orderID'] as String,
      orderReference: map['orderReference'] as String,
      createdAt: (map['createdAt'] as num?)?.toInt() ?? 0,
      updatedAt: (map['updatedAt'] as num?)?.toInt() ?? 0,
      requiredByDeliveryDate: map['requiredByDeliveryDate'] as String,
      comments: map['comments'] as String,
      isDraft: map['isDraft'] as bool,
      patientTreatmentProductItems: List<PatientTreatmentProductItem>.from(
        (map['patientTreatmentProductItems'] as Iterable<dynamic>? ??
                <dynamic>[])
            .map<PatientTreatmentProductItem>(
          (dynamic x) => PatientTreatmentProductItem.fromMap(
            x as Map<String, dynamic>,
          ),
        ),
      ),
    );
  }

  factory Order.fromJson(String source) =>
      Order.fromMap(jsonDecode(source) as Map<String, dynamic>);

  factory Order.fromEntity(OrderEntity entity) {
    return Order(
      orderID: entity.orderID ?? '',
      orderReference: entity.orderReference ?? '',
      createdAt: entity.createdAt ?? -1,
      updatedAt: entity.updatedAt ?? -1,
      requiredByDeliveryDate: entity.requiredByDeliveryDate ?? '',
      comments: entity.comments ?? '',
      isDraft: entity.isDraft ?? false,
      patientTreatmentProductItems: entity.patientTreatmentProductItems ?? [],
    );
  }

  final String orderID;
  final String orderReference;
  final int createdAt;
  final int updatedAt;
  final String requiredByDeliveryDate;
  final String comments;
  final bool isDraft;
  final List<PatientTreatmentProductItem> patientTreatmentProductItems;

  Order copyWith({
    String? orderID,
    String? orderReference,
    int? createdAt,
    int? updatedAt,
    String? requiredByDeliveryDate,
    String? comments,
    bool? isDraft,
    List<PatientTreatmentProductItem>? patientTreatmentProductItems,
  }) {
    return Order(
      orderID: orderID ?? this.orderID,
      orderReference: orderReference ?? this.orderReference,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      requiredByDeliveryDate:
          requiredByDeliveryDate ?? this.requiredByDeliveryDate,
      comments: comments ?? this.comments,
      isDraft: isDraft ?? this.isDraft,
      patientTreatmentProductItems:
          patientTreatmentProductItems ?? this.patientTreatmentProductItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, Object?>{
      'orderID': orderID,
      'orderReference': orderReference,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'requiredByDeliveryDate': requiredByDeliveryDate,
      'comments': comments,
      'isDraft': isDraft,
      'patientTreatmentProductItems':
          patientTreatmentProductItems.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());

  OrderEntity toEntity() {
    return OrderEntity(
      orderID: orderID,
      orderReference: orderReference,
      createdAt: createdAt,
      updatedAt: updatedAt,
      requiredByDeliveryDate: requiredByDeliveryDate,
      comments: comments,
      isDraft: isDraft,
      patientTreatmentProductItems: patientTreatmentProductItems,
      snapshot: null,
      reference: null,
      documentID: orderID,
    );
  }

  @override
  String toString() {
    return 'Order(orderID: $orderID, orderReference: $orderReference, createdAt: $createdAt, updatedAt: $updatedAt, requiredByDeliveryDate: $requiredByDeliveryDate, comments: $comments, isDraft: $isDraft, patientTreatmentProductItems: $patientTreatmentProductItems)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Order &&
        other.orderID == orderID &&
        other.orderReference == orderReference &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.requiredByDeliveryDate == requiredByDeliveryDate &&
        other.comments == comments &&
        other.isDraft == isDraft &&
        listEquals(
          other.patientTreatmentProductItems,
          patientTreatmentProductItems,
        );
  }

  @override
  int get hashCode {
    return orderID.hashCode ^
        orderReference.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        requiredByDeliveryDate.hashCode ^
        comments.hashCode ^
        isDraft.hashCode ^
        patientTreatmentProductItems.hashCode;
  }
}
