import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Article5 extends StatelessWidget {
  const Article5({Key? key}) : super(key: key);

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor,
        title: Text(
          'Artikel',
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const TitleArticelWidget(
                title: 'Cegah Stunting Itu Penting!',
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/artikel5-1.jpg',
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const TextArticleWidget(
                text:
                    'Pencegahan stunting sebaiknya dilakukan sedini mungkin. Remaja putri dapat melakukan pencegahan dengan mengkonsumsi tablet tambah darah (TTD) sebanyak 1 tablet per minggu, melakukan aktivitas fisik minimal 30 menit sehari serta menerapkan pola makan sesuai pedoman gizi seimbang.',
              ),
              const ListArticleWidget(
                text:
                    'CEGAH ANEMIA dengan konsumsi tablet tambah darah sebanyak 1 tablet setiap 1 minggu',
              ),
              const ListArticleWidget(
                text:
                    'OLAHRAGA Aktivitas fisik secara rutin. Minimal 30 menit sehari.',
              ),
              const ListArticleWidget(
                text: 'POLA MAKAN dengan:',
              ),
              const SizedBox(
                height: 30,
              ),
              const ListArticleWidget(
                text: 'Perbanyak makan buah dan sayur',
              ),
              const ListArticleWidget(
                text: 'Makan sesuai gizi seimbang',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
