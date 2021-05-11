import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, DocumentSnapshot;

class UserEntity {
  const UserEntity({
    required this.userID,
    required this.emailAddress,
    required this.lastName,
    required this.firstName,
    required this.snapshot,
    required this.reference,
  });

  factory UserEntity.fromFirestore(DocumentSnapshot snapshot) {
    final Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;

    return UserEntity(
      emailAddress: map['emailAddress'] as String,
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      snapshot: snapshot,
      reference: snapshot.reference,
      userID: snapshot.id,
    );
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      userID: map['userID'] as String,
      emailAddress: map['emailAddress'] as String,
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      snapshot: map['snapshot'] as DocumentSnapshot,
      reference: map['reference'] as DocumentReference,
    );
  }

  factory UserEntity.fromJson(String json) {
    return UserEntity.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }

  final String emailAddress;
  final String lastName;
  final String firstName;
  final DocumentSnapshot snapshot;
  final DocumentReference reference;

  /// To use Firebase Auth UID as key in `users` collection
  ///
  /// Reuse documentID
  /// Should not have any nulls as we query this directly from Firestore
  /// and sign up internally
  ///
  final String? userID;

  Map<String, dynamic> toMap() => <String, String?>{
        'userID': userID,
        'emailAddress': emailAddress,
        'lastName': lastName,
        'firstName': firstName,
      };

  UserEntity copyWith({
    String? emailAddress,
    String? lastName,
    String? firstName,

    /// Copy over fields while keeping the same ID snapshot references?
    ///
    String? userID,
    DocumentSnapshot? snapshot,
    DocumentReference? reference,
  }) {
    return UserEntity(
      userID: userID ?? this.userID,
      emailAddress: emailAddress ?? this.emailAddress,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      snapshot: snapshot ?? this.snapshot,
      reference: reference ?? this.reference,
    );
  }

  /// The data parts only?
  Map<String, Object?> toDocument() {
    return {
      'emailAddress': emailAddress,
      'lastName': lastName,
      'firstName': firstName,
    };
  }

  @override
  String toString() {
    return '${userID.toString()}, ${emailAddress.toString()}, ${lastName.toString()}, ${firstName.toString()}, ';
  }

  @override
  bool operator ==(other) => other is UserEntity && userID == other.userID;

  int get hashCode => userID.hashCode;
}
