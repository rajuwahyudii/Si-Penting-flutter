import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
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
              )
            ],
          )),
        ),
      ),
    );
  }
}
