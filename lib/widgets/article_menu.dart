import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleMenu extends StatelessWidget {
  String title;
  Function? press;
  ArticleMenu({
    this.press,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press != null
          ? () {
              press!();
            }
          : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: size.width * 0.95,
        height: size.height * 0.13,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            17,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 100.0),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
