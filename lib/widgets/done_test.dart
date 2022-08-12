import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/animation.dart';

// ignore: must_be_immutable
class DoneTest extends StatelessWidget {
  String introduction;
  DoneTest({
    required this.introduction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset(
          'assets/images/scorepage.png',
          width: 300,
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            introduction,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        BottomAnime(
          1,
          30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: size.width / 2,
                height: size.height / 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Menu(),
                      ),
                    );
                  },
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
    );
  }
}
