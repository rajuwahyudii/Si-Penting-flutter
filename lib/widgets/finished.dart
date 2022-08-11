import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/animation.dart';

class FinishScreen extends StatelessWidget {
  VoidCallback onPressed;
  int totalScore;
  FinishScreen({required this.onPressed, required this.totalScore});
  String get resultPhrase {
    String resultText;
    if (totalScore <= 10) {
      resultText = "Luar biasa!";
    } else if (totalScore <= 15) {
      resultText = "Keren!";
    } else if (totalScore <= 20) {
      resultText = "Kerja Bagus!";
    } else {
      resultText = "Amazing!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // Instagram => @CodeWithFlexz
    // Github => AmirBayat0
    // Youtube => Programming with Flexz
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomAnime(
            1,
            20,
            child: Text(
              resultPhrase,
              style: const TextStyle(
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
          BottomAnime(
            1,
            20,
            child: Text(
              "Skor mu : $totalScore",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
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
