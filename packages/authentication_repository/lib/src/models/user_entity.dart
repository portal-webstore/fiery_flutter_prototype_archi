import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  final String emailAddress;
  final String lastName;
  final String firstName;
  final DocumentSnapshot snapshot;
  final DocumentReference reference;
  final String userID;

  UserEntity({
    this.emailAddress,
    this.lastName,
    this.firstName,
    this.snapshot,
    this.reference,
    this.userID,
  });

  factory UserEntity.fromFirestore(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
    var map = snapshot.data();

    return UserEntity(
      emailAddress: map['emailAddress'],
      lastName: map['lastName'],
      firstName: map['firstName'],
      snapshot: snapshot,
      reference: snapshot.reference,
      userID: snapshot.id,
    );
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserEntity(
      emailAddress: map['emailAddress'],
      lastName: map['lastName'],
      firstName: map['firstName'],
    );
  }

  Map<String, dynamic> toMap() => {
        'emailAddress': emailAddress,
        'lastName': lastName,
        'firstName': firstName,
      };

  UserEntity copyWith({
    String emailAddress,
    String lastName,
    String firstName,
  }) {
    return UserEntity(
      emailAddress: emailAddress ?? this.emailAddress,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  String toString() {
    return '${emailAddress.toString()}, ${lastName.toString()}, ${firstName.toString()}, ';
  }

  @override
  bool operator ==(other) => other is UserEntity && userID == other.userID;

  int get hashCode => userID.hashCode;
}
