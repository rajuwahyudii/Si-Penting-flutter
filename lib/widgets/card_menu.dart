import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MateriCard extends StatelessWidget {
  String title;
  MateriCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title),
            ]),
      ),
    );
  }
}
