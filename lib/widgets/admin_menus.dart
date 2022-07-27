import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';

class AdminMenusWidget extends StatelessWidget {
  final Function press;
  final String text;
  final String url;
  const AdminMenusWidget({
    required this.url,
    required this.text,
    required this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          color: buttonBlueColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              17,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              url,
              width: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
