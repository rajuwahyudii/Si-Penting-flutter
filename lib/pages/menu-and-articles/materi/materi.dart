import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';

class Materi extends StatefulWidget {
  const Materi({Key? key}) : super(key: key);

  @override
  State<Materi> createState() => _MateriState();
}

class _MateriState extends State<Materi> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
        ),
        backgroundColor: backgroundColor,
        title: Text(
          'Materi',
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            Column(
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}
