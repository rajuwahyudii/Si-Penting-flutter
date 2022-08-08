// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User user = auth.currentUser!;
  final id = user.uid;

  //login dengan menggunakan email dan password
  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print('e');
    }
    return null;
  }

  //Register
  static Future<User?> signUp(
      String email, String password, String nama) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? firebaseUser = result.user;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .set({
            "id": user.uid,
            "role": "user",
            "nama": nama,
            "email": email,
            "password": password,
            "class": 1,
            "createdAt": DateTime.now()
          })
          .then(
            (value) => print('User berhasil ditambah'),
          )
          .catchError(
            (error) => print('User gagal ditambahkan $error'),
          );
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logout
  static Future<User?> signOut() async {
    await auth.signOut();
    return null;
  }

  // ignore: non_constant_identifier_names
  static Stream<User?> get FirebaseUserStream => auth.authStateChanges();
}
