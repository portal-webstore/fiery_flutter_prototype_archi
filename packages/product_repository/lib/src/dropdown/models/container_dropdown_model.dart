import 'dart:convert' show json;

import 'package:equatable/equatable.dart' show Equatable;

/// Containers for dropdown-assistive free text
class ContainerDropdown extends Equatable {
  const ContainerDropdown({
    required this.containerName,
  });
  factory ContainerDropdown.fromMap(
    Map<String, dynamic> map,
  ) {
    return ContainerDropdown(
      containerName: map['containerName'] as String? ?? '',
    );
  }

  factory ContainerDropdown.fromJson(
    String source,
  ) =>
      ContainerDropdown.fromMap(json.decode(source) as Map<String, dynamic>);

  final String containerName;

  ContainerDropdown copyWith({
    String? containerName,
  }) {
    return ContainerDropdown(
      containerName: containerName ?? this.containerName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, String>{
      'containerName': containerName,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [containerName];
}
