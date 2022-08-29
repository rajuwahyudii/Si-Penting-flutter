import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class IntroductionTest extends StatelessWidget {
  String introduction;
  IntroductionTest({
    required this.introduction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset(
          'assets/images/teacher.png',
          width: 350,
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            introduction,
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
