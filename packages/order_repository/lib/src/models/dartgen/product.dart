import 'dart:convert';

import 'package:collection/collection.dart';

import 'drug.dart';

class Product {
  final String productName;
  final List<Drug> drugs;
  final String diluentName;
  final String containerName;
  final String containerCustomName;
  final double containerVolume;
  final bool containerIsFixedFinalVolume;
  final String administrationRoute;
  final String attachmentName;

  /// OCS specials.
  /// To help reconcile auto
  ///
  /// Otherwise we fallback to manual checking on the order reintegration side
  /// (future reintegration part)
  ///
  final int ocsProductLink;
  Product({
    required this.productName,
    required this.drugs,
    required this.diluentName,
    required this.containerName,
    required this.containerCustomName,
    required this.containerVolume,
    required this.containerIsFixedFinalVolume,
    required this.administrationRoute,
    required this.attachmentName,
    required this.ocsProductLink,
  });

  Product copyWith({
    String? productName,
    List<Drug>? drugs,
    String? diluentName,
    String? containerName,
    String? containerCustomName,
    double? containerVolume,
    bool? containerIsFixedFinalVolume,
    String? administrationRoute,
    String? attachmentName,
    int? ocsProductLink,
  }) {
    return Product(
      productName: productName ?? this.productName,
      drugs: drugs ?? this.drugs,
      diluentName: diluentName ?? this.diluentName,
      containerName: containerName ?? this.containerName,
      containerCustomName: containerCustomName ?? this.containerCustomName,
      containerVolume: containerVolume ?? this.containerVolume,
      containerIsFixedFinalVolume:
          containerIsFixedFinalVolume ?? this.containerIsFixedFinalVolume,
      administrationRoute: administrationRoute ?? this.administrationRoute,
      attachmentName: attachmentName ?? this.attachmentName,
      ocsProductLink: ocsProductLink ?? this.ocsProductLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productName': productName,
      'drugs': drugs.map((x) => x.toMap()).toList(),
      'diluentName': diluentName,
      'containerName': containerName,
      'containerCustomName': containerCustomName,
      'containerVolume': containerVolume,
      'containerIsFixedFinalVolume': containerIsFixedFinalVolume,
      'administrationRoute': administrationRoute,
      'attachmentName': attachmentName,
      'ocsProductLink': ocsProductLink,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    final Iterable<Drug> drugs =
        (map['drugs'] as Iterable<Map<String, dynamic>>?)?.map<Drug>(
              (x) => Drug.fromMap(x),
            ) ??
            [];

    return Product(
      productName: map['productName'] as String,
      drugs: List<Drug>.from(
        drugs,
      ),
      diluentName: map['diluentName'] as String,
      containerName: map['containerName'] as String,
      containerCustomName: map['containerCustomName'] as String,
      containerVolume: (['containerVolume'] as num).toDouble(),
      containerIsFixedFinalVolume: map['containerIsFixedFinalVolume'] as bool,
      administrationRoute: map['administrationRoute'] as String,
      attachmentName: map['attachmentName'] as String,
      ocsProductLink: map['ocsProductLink'] as int,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(jsonDecode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(productName: $productName, drugs: $drugs, diluentName: $diluentName, containerName: $containerName, containerCustomName: $containerCustomName, containerVolume: $containerVolume, containerIsFixedFinalVolume: $containerIsFixedFinalVolume, administrationRoute: $administrationRoute, attachmentName: $attachmentName, ocsProductLink: $ocsProductLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Product &&
        other.productName == productName &&
        listEquals(other.drugs, drugs) &&
        other.diluentName == diluentName &&
        other.containerName == containerName &&
        other.containerCustomName == containerCustomName &&
        other.containerVolume == containerVolume &&
        other.containerIsFixedFinalVolume == containerIsFixedFinalVolume &&
        other.administrationRoute == administrationRoute &&
        other.attachmentName == attachmentName &&
        other.ocsProductLink == ocsProductLink;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        drugs.hashCode ^
        diluentName.hashCode ^
        containerName.hashCode ^
        containerCustomName.hashCode ^
        containerVolume.hashCode ^
        containerIsFixedFinalVolume.hashCode ^
        administrationRoute.hashCode ^
        attachmentName.hashCode ^
        ocsProductLink.hashCode;
  }
}
