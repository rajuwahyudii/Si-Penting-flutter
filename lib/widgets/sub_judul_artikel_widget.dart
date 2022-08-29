import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleArtikelWidget extends StatelessWidget {
  final String title;
  const SubtitleArtikelWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(left: 15, bottom: 5, top: 15),
      child: Text(
        ("-  ") + title,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
