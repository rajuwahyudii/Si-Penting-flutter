import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswerCards extends StatelessWidget {
  dynamic ontap;
  String answerText;

  AnswerCards({
    Key? key,
    required this.ontap,
    required this.answerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        width: width,
        height: height / 9,
        // ignore: sort_child_properties_last
        child: Text(
          answerText,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
