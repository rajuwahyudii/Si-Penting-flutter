// ignore_for_file: avoid_print, non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User user = auth.currentUser!;

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print('e');
    }
  }

  static Future<User?> nextMateri(int index) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        "class": index,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<User?> signUp(
      String email, String password, String nama) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User idreg = auth.currentUser!;

      User? firebaseUser = result.user;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(idreg.uid)
          .set({
            "id": idreg.uid,
            "new": true,
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
    }
  }

  static Future<User?> HasilPretestGanda(
    int score,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'score pretest ganda': score,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> HasilPretestSikap(
    int score,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'score pretest sikap': score,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> IsNew(
    bool intro,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      User idreg = auth.currentUser!;
      await FirebaseFirestore.instance
          .collection('user')
          .doc(idreg.uid)
          .update({
        'new': intro,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> HasilPretestPrilaku(
    int score,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'score pretest prilaku': score,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> HasilTestEsai(
    String id,
    int pretest,
    int postest,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(id).update({
        'score pretest esai': pretest,
        'score postest esai': postest,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> HasilPostestPrilaku(
    int score,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'score postest prilaku': score,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> HasilPostestGanda(
    int score,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'score postest ganda': score,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> PretestEsai1(
    String jawaban,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'pretest esai1': jawaban,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> PretestEsai2(
    String jawaban,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'pretest esai2': jawaban,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> PostestEsai1(
    String jawaban,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'postest esai1': jawaban,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> PostestEsai2(
    String jawaban,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'postest esai2': jawaban,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> HasilPostestSikap(
    int score,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update({
        'score postest sikap': score,
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> signOut() async {
    await auth.signOut();
  }

  static Stream<User?> get FirebaseUserStream => auth.authStateChanges();
}
