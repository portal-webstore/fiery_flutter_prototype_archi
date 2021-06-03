import 'dart:convert' show json;

import 'package:equatable/equatable.dart' show Equatable;

class StartOrderFormInput extends Equatable {
  const StartOrderFormInput({
    required this.orderReference,
    required this.requiredByDeliveryDart,
    required this.comments,
  });

  factory StartOrderFormInput.fromMap(Map<String, dynamic> map) {
    return StartOrderFormInput(
      orderReference: map['orderReference'] as String? ?? '',
      requiredByDeliveryDart: map['requiredByDeliveryDart'] as String? ?? '',
      comments: map['comments'] as String? ?? '',
    );
  }
  factory StartOrderFormInput.fromJson(String source) =>
      StartOrderFormInput.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String orderReference;
  final String requiredByDeliveryDart;
  final String comments;

  StartOrderFormInput copyWith({
    String? orderReference,
    String? requiredByDeliveryDart,
    String? comments,
  }) {
    return StartOrderFormInput(
      orderReference: orderReference ?? this.orderReference,
      requiredByDeliveryDart:
          requiredByDeliveryDart ?? this.requiredByDeliveryDart,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderReference': orderReference,
      'requiredByDeliveryDart': requiredByDeliveryDart,
      'comments': comments,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        orderReference,
        requiredByDeliveryDart,
        comments,
      ];
}
