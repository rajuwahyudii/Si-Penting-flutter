import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputButtonWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboard;
  final String label;
  final bool obsuretext;
  const InputButtonWidget({
    required this.obsuretext,
    required this.controller,
    required this.keyboard,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: 4 / 5 * size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          TextFormField(
            keyboardType: keyboard,
            controller: controller,
            obscureText: obsuretext,
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.center,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              alignLabelWithHint: true,
              hintText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
              ),
              fillColor: Colors.white70,
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}
