import 'package:flutter/material.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              'Login'.toUpperCase(),
              style: splashTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
