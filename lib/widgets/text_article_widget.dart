import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextArticleWidget extends StatelessWidget {
  final String text;
  const TextArticleWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      child: Text(
        '   $text',
        style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
