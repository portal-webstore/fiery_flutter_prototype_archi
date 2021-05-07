import 'dart:convert';

import 'package:collection/collection.dart';

import 'container_custom_name.dart';
import 'drug.dart';
import 'ocs_product_link.dart';

class Product {
  final String productName;
  final List<Drug> drugs;
  final String diluentName;
  final String containerName;
  final ContainerCustomName containerCustomName;
  final int containerVolume;
  final bool containerIsFixedFinalVolume;
  final String administrationRoute;
  final String attachmentName;
  final OcsProductLink ocsProductLink;
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
    ContainerCustomName? containerCustomName,
    int? containerVolume,
    bool? containerIsFixedFinalVolume,
    String? administrationRoute,
    String? attachmentName,
    OcsProductLink? ocsProductLink,
  }) {
    return Product(
      productName: productName ?? this.productName,
      drugs: drugs ?? this.drugs,
      diluentName: diluentName ?? this.diluentName,
      containerName: containerName ?? this.containerName,
      containerCustomName: containerCustomName ?? this.containerCustomName,
      containerVolume: containerVolume ?? this.containerVolume,
      containerIsFixedFinalVolume: containerIsFixedFinalVolume ?? this.containerIsFixedFinalVolume,
      administrationRoute: administrationRoute ?? this.administrationRoute,
      attachmentName: attachmentName ?? this.attachmentName,
      ocsProductLink: ocsProductLink ?? this.ocsProductLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'drugs': drugs?.map((x) => x.toMap())?.toList(),
      'diluentName': diluentName,
      'containerName': containerName,
      'containerCustomName': containerCustomName.toMap(),
      'containerVolume': containerVolume,
      'containerIsFixedFinalVolume': containerIsFixedFinalVolume,
      'administrationRoute': administrationRoute,
      'attachmentName': attachmentName,
      'ocsProductLink': ocsProductLink.toMap(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productName: map['productName'],
      drugs: List<Drug>.from(map['drugs']?.map((x) => Drug.fromMap(x))),
      diluentName: map['diluentName'],
      containerName: map['containerName'],
      containerCustomName: ContainerCustomName.fromMap(map['containerCustomName']),
      containerVolume: map['containerVolume']?.toInt(),
      containerIsFixedFinalVolume: map['containerIsFixedFinalVolume'],
      administrationRoute: map['administrationRoute'],
      attachmentName: map['attachmentName'],
      ocsProductLink: OcsProductLink.fromMap(map['ocsProductLink']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

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