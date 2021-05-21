import 'dart:convert' show json;

import 'package:equatable/equatable.dart' show Equatable;

/// Diluents for dropdown-assistive free text
class DiluentDropdown extends Equatable {
  const DiluentDropdown({
    required this.diluentName,
  });
  factory DiluentDropdown.fromMap(
    Map<String, dynamic> map,
  ) {
    return DiluentDropdown(
      diluentName: map['diluentName'] as String? ?? '',
    );
  }

  factory DiluentDropdown.fromJson(
    String source,
  ) =>
      DiluentDropdown.fromMap(json.decode(source) as Map<String, dynamic>);

  final String diluentName;

  DiluentDropdown copyWith({
    String? diluentName,
  }) {
    return DiluentDropdown(
      diluentName: diluentName ?? this.diluentName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, String>{
      'diluentName': diluentName,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [diluentName];
}
