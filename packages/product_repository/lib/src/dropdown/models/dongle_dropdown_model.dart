import 'dart:convert' show json;

import 'package:equatable/equatable.dart' show Equatable;

/// Dongles for dropdown-assistive free text
class DongleDropdown extends Equatable {
  const DongleDropdown({
    required this.dongleName,
  });
  factory DongleDropdown.fromMap(
    Map<String, dynamic> map,
  ) {
    return DongleDropdown(
      dongleName: map['dongleName'] as String? ?? '',
    );
  }

  factory DongleDropdown.fromJson(
    String source,
  ) =>
      DongleDropdown.fromMap(json.decode(source) as Map<String, dynamic>);

  final String dongleName;

  DongleDropdown copyWith({
    String? dongleName,
  }) {
    return DongleDropdown(
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
