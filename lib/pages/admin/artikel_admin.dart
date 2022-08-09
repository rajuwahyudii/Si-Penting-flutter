import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/pages/admin/admin.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';
import 'package:stunting/widgets/admin_articles.dart';

class ArtikelAdmin extends StatefulWidget {
  const ArtikelAdmin({Key? key}) : super(key: key);

  @override
  State<ArtikelAdmin> createState() => _ArtikelAdminState();
}

class _ArtikelAdminState extends State<ArtikelAdmin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Pertanyaan',
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AdminPage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SizedBox(
              height: 20,
            ),
            BarArticlesAdminWidget(
              judul: 'Aku',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        height: size.height * 0.13,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              yellowButtonColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          child: Text(
            'Tambah Pertanyaan',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
