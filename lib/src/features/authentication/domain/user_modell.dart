import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String email;
  final String name;

  User({required this.uid, required this.email, required this.name});

  factory User.fromFirebase(UserCredential userCredential) {
    return User(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: '',
    );
  }

  static Future<User> getUserFromFirebase(UserCredential userCredential) async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .get();
    final userName = userDoc.get('name') as String;

    return User(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: userName,
    );
  }
}
