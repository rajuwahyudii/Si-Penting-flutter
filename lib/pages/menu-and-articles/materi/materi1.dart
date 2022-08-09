import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Materi1 extends StatefulWidget {
  const Materi1({Key? key}) : super(key: key);

  @override
  State<Materi1> createState() => _Materi1State();
}

class _Materi1State extends State<Materi1> {
  PageController pageController = PageController();
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
          controller: pageController,
          children: <Widget>[
            Column(
              children: <Widget>[
                const TitleArticelWidget(
                  title: 'Pengertian Stunting',
                ),
                Image.asset(
                  'assets/images/materi1.png',
                  width: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextArticleWidget(
                  text:
                      'Stunting adalah kondisi gagal tumbuh pada anak balita akibat kekurangan gizi kronis, terutama pada masa 1000 hari pertama kehidupan (HPK) yaitu periode emas pertumbuhan dan perkembangan yang dimulai semenjak terbentuknya janin hingga anak berusia 2 tahun, bukan hanya terganggu pertumbuhan fisiknya (bertubuh kecil/kerdil) sajah, melainkan juga terganggu perkembangan otak yang nantinya mempengaruhi kemampuan dan prestasi di sekolah, produktivitas dan kreativitas di usia produktif.',
                ),
                const SizedBox(
                  height: 50,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            EndOfMateri(
                text: 'Lanjut',
                press: () async {
                  await AuthServices.nextMateri(2)
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Berhasil Menyelesaikan Materi 1"),
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
                })
          ],
        ),
      ),
    );
  }
}
