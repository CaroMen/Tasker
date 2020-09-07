import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String profileImgUrl;
  final String email;

  User({this.id, this.name, this.profileImgUrl, this.email});

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      profileImgUrl: doc['profileImgUrl'],
      email: doc['email'],
    );
  }
}
