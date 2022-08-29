import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleArticelWidget extends StatelessWidget {
  final String title;
  const TitleArticelWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
