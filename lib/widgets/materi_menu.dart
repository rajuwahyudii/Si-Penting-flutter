import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MateriMenu extends StatelessWidget {
  String title;
  bool isDone = false;
  Function? press;
  MateriMenu({
    required this.title,
    this.press,
    required this.isDone,
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
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$title ',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                isDone
                    ? const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 40,
                      )
                    : const Icon(
                        Icons.new_releases,
                        color: Colors.red,
                        size: 40,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
