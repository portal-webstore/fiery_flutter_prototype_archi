import 'dart:convert' show jsonDecode, jsonEncode;

import 'package:equatable/equatable.dart' show Equatable;

class User extends Equatable {
  const User({
    required this.userID,
    required this.emailAddress,
    required this.lastName,
    required this.firstName,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userID: map['userID'] as String? ?? '',
      emailAddress: map['emailAddress'] as String? ?? '',
      lastName: map['lastName'] as String? ?? '',
      firstName: map['firstName'] as String? ?? '',
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(jsonDecode(source) as Map<String, dynamic>);

  static const empty = User(
    userID: '',
    emailAddress: '',
    lastName: '',
    firstName: '',
  );

  final String userID;
  final String emailAddress;
  final String lastName;
  final String firstName;
  User copyWith({
    String? userID,
    String? emailAddress,
    String? lastName,
    String? firstName,
  }) {
    return User(
      userID: userID ?? this.userID,
      emailAddress: emailAddress ?? this.emailAddress,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, String>{
      'userID': userID,
      'emailAddress': emailAddress,
      'lastName': lastName,
      'firstName': firstName,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [userID, emailAddress, lastName, firstName];
}
