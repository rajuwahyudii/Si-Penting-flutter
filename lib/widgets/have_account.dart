import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';

class HaveAccount extends StatelessWidget {
  final String ask;
  final String fiture;
  final Function press;

  const HaveAccount({
    required this.ask,
    required this.press,
    required this.fiture,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 4 / 6 * size.width,
      child: Row(
        children: <Widget>[
          Text(
            ask,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          TextButton(
            // ignore: unnecessary_null_comparison
            onPressed: press != null
                ? () {
                    press();
                  }
                : null,
            child: Text(
              fiture,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: buttonBlueColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
