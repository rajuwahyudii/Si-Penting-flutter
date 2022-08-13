// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';

class QuizEsai extends StatelessWidget {
  Function press;
  dynamic questions;
  int index;
  QuizEsai({
    required this.press,
    this.questions,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: height / 3,
            width: width,
            padding: EdgeInsets.all(5),
            // ignore: sort_child_properties_last
            child: Center(
              child: Text(
                questions[index]['questionText'],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xF62975D0),
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            maxLength: 100,
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              fillColor: Colors.white70,
              filled: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            // ignore: sort_child_properties_last
            child: Text(
              'Submit',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            // ignore: unnecessary_null_comparison
            onPressed: press != null
                ? () {
                    press();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: yellowButtonColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
