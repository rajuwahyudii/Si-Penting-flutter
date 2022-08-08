import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Materi4 extends StatefulWidget {
  const Materi4({Key? key}) : super(key: key);

  @override
  State<Materi4> createState() => _Materi4State();
}

class _Materi4State extends State<Materi4> {
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
              children: <Widget>[
                const TitleArticelWidget(
                  title: 'Dampak Stunting',
                ),
                Image.asset(
                  'assets/images/materi5.jpg',
                  width: 300,
                ),
                const SubtitleArtikelWidget(
                  title: 'Dampak dalam waktu jangka pendek',
                ),
                const ListArticleWidget(
                  text: 'Terganggunya perkembangan otak',
                ),
                const ListArticleWidget(
                  text: 'Kecerdasan berkurang',
                ),
                const ListArticleWidget(
                  text: 'Gangguan metabolisme dalam tubuh',
                ),
                const SubtitleArtikelWidget(
                  title: 'Dampak jangka panjang',
                ),
                const ListArticleWidget(
                  text: 'Menurunya kemampuan kognitif dan prestasi belajar',
                ),
                const ListArticleWidget(
                  text:
                      'Menurunnya kekebalan tubuh sehinggah mudah terserang penyakit',
                ),
                const ListArticleWidget(
                  text:
                      'Resiko tinggi munculnya penyakit diabetes, obesitas, penyakit antung dan pembuluh darah, kanker, stroke dan disabilitas pada usia tua',
                ),
              ],
            ),
            EndOfMateri(
              text: 'Lanjut',
              press: () async {
                await AuthServices.nextMateri(5)
                    .then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Berhasil Menyelesaikan Materi 4"),
                        ),
                      ),
                    )
                    .onError(
                      (error, stackTrace) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Permintaan Gagal"),
                        ),
                      ),
                    );
                // ignore: use_build_context_synchronously
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Menu(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
