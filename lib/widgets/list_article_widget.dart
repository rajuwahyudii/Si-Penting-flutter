import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListArticleWidget extends StatelessWidget {
  final String text;
  const ListArticleWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' • ',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 10,
            bottom: 10,
          ),
          width: size.width * 0.9,
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
