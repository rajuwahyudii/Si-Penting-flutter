import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

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
              ],
            ),
            Column(
              children: <Widget>[
                const TitleArticelWidget(
                  title: 'GEJALA STUNTING/CIRI CIRI STUNTING',
                ),
                Image.asset(
                  'assets/images/materi2.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 50,
                ),
                const ListArticleWidget(
                  text: 'Pertumbuhan melambat',
                ),
                const ListArticleWidget(
                  text:
                      'Usia 8-10 tahun anak menjadi lebih pendiam, tidak banyak melakukan eye contact',
                ),
                const ListArticleWidget(
                  text: 'Wajah tampak lebih mudah dari usianya',
                ),
                const ListArticleWidget(
                  text: 'Pubertas terlambat',
                ),
                const ListArticleWidget(
                  text: 'Pertumbuhan gigi terlambat',
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                TitleArticelWidget(
                  title: 'PENYEBAB STUNTING',
                ),
                SizedBox(
                  height: 50,
                ),
                TextArticleWidget(
                  text:
                      'Diketahui penyebab stunting sangat kompleks. Namun, penyebab atau faktor risiko utama dapat dikategorikan menjadi:',
                ),
                SubtitleArtikelWidget(
                  title: 'Faktor Genetik',
                ),
                TextArticleWidget(
                  text:
                      'Tinggi badan orangtua sendiri sebenarnya juga dipengaruhi banyak faktor yaitu faktor internal seperti faktor genetik dan faktor eksternal seperti faktor penyakit dan asupan gizi sejak usia dini. Faktor genetik adalah faktor yang tidak dapat diubah sedangkan faktor eksternal adalah faktor yang dapat diubah. Hal ini berarti jika ayah pendek karena gen-gen yang ada pada kromosomnya memang membawa sifat pendek dan gen-gen ini diwariskan pada keturunannya, maka stunting yang timbul pada anak atau keturunannya sulit untuk ditanggulangi. Tetapi bila ayah pendek karena faktor penyakit atau asupan gizi yang kurang sejak dini, seharusnya tidak akan mempengaruhi tinggi badan anaknya. ',
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                TextArticleWidget(
                  text:
                      'Anak tetap dapat memiliki tinggi badan normal asalkan tidak terpapar oleh faktor-faktor risiko yang lain.',
                ),
                SubtitleArtikelWidget(
                  title: 'Status Ekonomi',
                ),
                TextArticleWidget(
                  text:
                      'Status ekonomi kurang dapat diartikan daya beli juga rendah sehingga kemampuan membeli bahan makanan yang baik juga rendah. Kualitas dan kuantitas makanan yang kurang menyebabkan kebutuhan zat gizi anak tidak terpenuhi, padahal anak memerlukan zat gizi yang lengkap untuk pertumbuhan dan perkembangannya. Pada kelompok status ekonomi kurang maupun status ekonomi cukup masih banyak dijumpai ibu yang memiliki pengetahuan rendah di bidang gizi. ',
                ),
                TextArticleWidget(
                    text:
                        'Walaupun mereka rutin ke posyandu, namun di posyandu mereka jarang memperoleh informasi tentang gizi. Informasi tentang gizi justeru diperoleh dari tenaga kesehatan yang mereka datangi pada saat anak sakit, itupun hanya sedikit. Informasi dari media massa maupun media cetak juga tidak banyak diperoleh karena ibu tifk gemar membaca artikel tentang kesehatan. ')
              ],
            ),
            Column(
              children: const <Widget>[
                TextArticleWidget(
                  text:
                      'Status ekonomi kurang seharusnya tidak menjadi kendala dalam pemenuhan kebutuhan gizi keluarga karena harga bahan pangan di negara kita sebenarnya tidak mahal dan sangat terjangkau. ',
                ),
                TextArticleWidget(
                    text:
                        'Jenis bahan makanan juga sangat bervariasi dan dapat diperoleh di mana saja. Namun karena pengetahuan akan gizi yang kurang menyebabkan banyak orangtua yang beranggapan bahwa zat gizi yang baik hanya terdapat dalam makanan yang mahal. Membuat masakan yang bergizi dan enak rasanya memang membutuhkan kreativitas dan kesabaran. Keterbatasan waktu terkadang membuat orangtua lebih senang membelikan makanan jajanan daripada memasak sendiri. Pada makanan jajanan sering ditambahkan zat-zat aditif yang bisa membahayakan kesehatan. Selain itu makanan jajanan kebersihan dan keamanannya sangat tidak terjamin.')
              ],
            )
          ],
        ),
      ),
    );
  }
}
