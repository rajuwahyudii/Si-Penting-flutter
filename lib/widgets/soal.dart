import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';

class Soal extends StatefulWidget {
  Soal({Key? key}) : super(key: key);

  @override
  State<Soal> createState() => _SoalState();
}

class _SoalState extends State<Soal> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width,
      height: size.height,
      child: Column(
        children: <Widget>[
          Text(
            'Apakah Saya Raju adawdwadawdawd awd awd wadwadwa awd awd',
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  autofocus: true,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.green,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.09,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "A. ",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Aku',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  autofocus: true,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.green,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.09,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "A. ",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Aku',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  autofocus: true,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.green,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.09,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "A. ",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Aku',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  autofocus: true,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.green,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.09,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: "A. ",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Aku',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
