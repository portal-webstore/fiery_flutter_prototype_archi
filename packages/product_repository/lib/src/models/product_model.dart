import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:collection/collection.dart' show DeepCollectionEquality;
import 'package:drug_repository/drug_repository.dart' show Drug;

abstract class Mappable<T> {
  Mappable.fromMap(dynamic map);
  Map<String, Object?> toMap();
}

class Product {
  const Product({
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

  /// Convert from a **queried** json map with no optionals.
  factory Product.fromMap(Map<String, dynamic> map) {
    final Iterable<Drug> drugs =
        getDrugsParsedFromProductMapAccessDynamicList(map);

    return Product(
      productName: map['productName'] as String,
      drugs: List<Drug>.from(
        drugs,
      ),
      diluentName: map['diluentName'] as String,
      containerName: map['containerName'] as String,
      containerCustomName: map['containerCustomName'] as String,
      containerVolume: (map['containerVolume'] as num).toDouble(),
      containerIsFixedFinalVolume: map['containerIsFixedFinalVolume'] as bool,
      administrationRoute: map['administrationRoute'] as String,
      attachmentName: map['attachmentName'] as String,

      /// This should not be null if we are querying from a json!
      ocsProductLink: map['ocsProductLink'] as int,
    );
  }

  /// See https://github.com/dart-lang/language/issues/356
  /// for info on abstract (no factory or constructors are abstractable)
  /// want to enforce the generic shape of having a fromMap serailising function
  /// same use case
  ///
  /// abstract static method
  ///
  ///  See potential emulation https://github.com/dart-lang/language/issues/356#issuecomment-494467605
  /// static Iterable<T> getIterableParsedFromDynamicList< T, G extends Mappable<T>>(
  static Iterable<Drug> getDrugsParsedFromProductMapAccessDynamicList(
    Map<String, dynamic> map,
  ) {
    return (map['drugs'] as Iterable<dynamic>?)?.map<Drug>((
          dynamic drugMap,
        ) {
          return Drug.fromMap(
            drugMap as Map<String, dynamic>,
          );
        }) ??
        <Drug>[];
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(jsonDecode(source) as Map<String, dynamic>);

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
  ///
  /// ocsLink is optional for when we create an ad hoc free-text without ID.
  /// To help reconcile auto
  ///
  /// Otherwise we fallback to manual checking on the order reintegration side
  /// (future reintegration part)
  ///
  final int? ocsProductLink;

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

  String toJson() => jsonEncode(toMap());

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
