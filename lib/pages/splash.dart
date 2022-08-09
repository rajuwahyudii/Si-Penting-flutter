import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stunting/pages/auth/login.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashTimer();
    super.initState();
  }

  Future<Timer> splashTimer() async {
    return Timer(const Duration(seconds: 4), onDone);
  }

  void onDone() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/splash.png',
              width: 341.54,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'STUNTING',
              style: splashTextStyle,
              textScaleFactor: 1,
            ),
          ],
        )),
      ),
    );
  }
}
