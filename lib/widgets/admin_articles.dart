import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';

class BarArticlesAdminWidget extends StatelessWidget {
  final String judul;
  const BarArticlesAdminWidget({required this.judul, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 100),
        width: size.width * 0.96,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(17),
          ),
          color: Colors.white,
        ),
        child: Text(
          judul,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
