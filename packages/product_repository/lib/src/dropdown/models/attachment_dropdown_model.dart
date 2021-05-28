import 'dart:convert' show json;

import 'package:equatable/equatable.dart' show Equatable;

/// Attached IV connector set closed system transfer device
/// Dongles for dropdown-assistive free text
///
/// These "Dongles" are attached at the end of the product manufacturing
/// for accessible, simpler, safer administration by facility nurses that
/// subsequently hook up and treat the patients with these products.
///
/// Terminology is not fully consistent end-to-end, industry, internally.
///
/// i.e. Spiros, CytoSet, Phaseal Luer Lock, CH12, CS10
///
/// Closed system drug transfer device (CSTD)
/// Closed system kit
/// CS catheter
class AttachmentDropdown extends Equatable {
  const AttachmentDropdown({
    required this.dongleName,
  });
  factory AttachmentDropdown.fromMap(
    Map<String, dynamic> map,
  ) {
    return AttachmentDropdown(
      dongleName: map['dongleName'] as String? ?? '',
    );
  }

  factory AttachmentDropdown.fromJson(
    String source,
  ) =>
      AttachmentDropdown.fromMap(json.decode(source) as Map<String, dynamic>);

  final String dongleName;

  AttachmentDropdown copyWith({
    String? dongleName,
  }) {
    return AttachmentDropdown(
      dongleName: dongleName ?? this.dongleName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, String>{
      'dongleName': dongleName,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [dongleName];
}
