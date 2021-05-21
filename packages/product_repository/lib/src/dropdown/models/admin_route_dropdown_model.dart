import 'dart:convert';

import 'package:equatable/equatable.dart';

/// Product administration routes for dropdown-assistive free text
class AdminRouteDropdown extends Equatable {
  const AdminRouteDropdown({
    required this.adminRouteCode,
    required this.adminRouteDescription,
    required this.defaultDirectionsHeaderText,
  });

  factory AdminRouteDropdown.fromMap(Map<String, dynamic> map) {
    return AdminRouteDropdown(
      adminRouteCode: map['adminRouteCode'] as String? ?? '',
      adminRouteDescription: map['adminRouteDescription'] as String? ?? '',
      defaultDirectionsHeaderText:
          map['defaultDirectionsHeaderText'] as String? ?? '',
    );
  }
  factory AdminRouteDropdown.fromJson(String source) =>
      AdminRouteDropdown.fromMap(json.decode(source) as Map<String, dynamic>);

  final String adminRouteCode;
  final String adminRouteDescription;
  final String defaultDirectionsHeaderText;
  AdminRouteDropdown copyWith({
    String? adminRouteCode,
    String? adminRouteDescription,
    String? defaultDirectionsHeaderText,
  }) {
    return AdminRouteDropdown(
      adminRouteCode: adminRouteCode ?? this.adminRouteCode,
      adminRouteDescription:
          adminRouteDescription ?? this.adminRouteDescription,
      defaultDirectionsHeaderText:
          defaultDirectionsHeaderText ?? this.defaultDirectionsHeaderText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, String>{
      'adminRouteCode': adminRouteCode,
      'adminRouteDescription': adminRouteDescription,
      'defaultDirectionsHeaderText': defaultDirectionsHeaderText,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [adminRouteCode, adminRouteDescription, defaultDirectionsHeaderText];
}
