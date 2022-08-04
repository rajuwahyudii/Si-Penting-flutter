import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/button.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/images/quis.png',
              width: 254,
            ),
            CustomButtonWidget(
              text: 'Start Quiz',
              press: () {},
              buttonColor: yellowButtonColor,
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
