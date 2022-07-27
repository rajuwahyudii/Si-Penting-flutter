import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          'Artikel',
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
    );
  }
}
