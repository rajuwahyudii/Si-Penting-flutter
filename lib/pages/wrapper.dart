import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stunting/pages/auth/login.dart';
import 'package:stunting/pages/menu.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);
    return (firebaseUser == null) ? Login() : Menu();
  }
}
