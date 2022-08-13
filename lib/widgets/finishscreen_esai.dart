import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/animation.dart';

// ignore: must_be_immutable
class FinishScreenEsai extends StatelessWidget {
  VoidCallback onPressed;
  FinishScreenEsai({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // Instagram => @CodeWithFlexz
    // Github => AmirBayat0
    // Youtube => Programming with Flexz
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomAnime(
            1,
            20,
            child: const Text(
              'Selamat',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Image.asset(
            'assets/images/scorepage.png',
            width: 250,
          ),
          const SizedBox(
            height: 100,
          ),
          BottomAnime(
            1,
            20,
            child: const Text(
              "Kamu Telah Menyelsaikan Test Esai",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BottomAnime(
            1,
            30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width / 2,
                  height: height / 10,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    // ignore: sort_child_properties_last
                    child: Text(
                      "Menu Utama",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(yellowButtonColor)),
                  ),
                )
                // RaisedButton(onPressed: onPressed),
                // FlatButton(onPressed: onPressed, child: Container()),
                // OutlineButton(onPressed: onPressed),
              ],
            ),
          )
        ],
      ),
    );
  }
}
