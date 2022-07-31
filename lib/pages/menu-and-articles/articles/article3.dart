import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Article3 extends StatelessWidget {
  const Article3({Key? key}) : super(key: key);

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
            children: const [
              TitleArticelWidget(
                title: 'Mengatasi Stunting Dari Kaca Mata Remaja',
              ),
              SizedBox(
                height: 30,
              ),
              TextArticleWidget(
                text:
                    'Pencegahan stunting dan penurunan prevalensinya  telah menjadi program prioritas nasional sejak 2018.  Stuntingadalah masalah yang kompleks, dimana upaya pencegahan untuk menekan prevalensinya harus terus dilakukan bersama antara pemerintah dan non-pemerintah, termasuk masyarakat, secara komprehensif.',
              ),
              TextArticleWidget(
                text:
                    'Sebagai bagian dari masyarakat, remaja, yang merupakan calon orang tua dan agent of change, dapat memainkan perannya dalam penurunan stunting. Remaja yang menjalankan perilaku hidup sehat, termasuk konsumsi makanan bergizi, dan memiliki wawasan mendalam tentang stunting, akan berpotensi menyuarakan permasalahan dan dampak stunting ke sesamanya atau masyarakat yang lebih luas.',
              ),
              TextArticleWidget(
                text:
                    'Enam belas popular feature yang ditampilkan antara lain “Remaja Laksar Penyuara Kesehatan Balita di Tanah Praja” oleh Nisrina Anis Millati. Nisrina memaparkan tentang program Garda Remaja Pencegah Stunting (GRPS) di Dusun Tawangsari, Semarang, Jawa Tengah, sebagai senjata untuk menyuarakan isu kesehatan balita. Sementara itu Talita Salsabila Kirana bicara tentang program terintegrasi untuk pemberdayaan perempuan dan remaja Indonesia melalui “Kamping; Kampungku Anti Stunting”. Masih ada 14 artikel lain dari berbagai lokasi yang tak kalah menarik.',
              ),
              TextArticleWidget(
                text:
                    'Dari buku ini kita dapat mengambil pembelajaran bagaimana remaja melihat stunting sebagai sebuah persoalan yang harus diatasi dan menjadi bagian dari tanggung jawab mereka. Termasuk pandangan-pandangan mereka untuk merespon problema stunting sesuai kapasitas remaja. Semangatnya, remaja ingin berkontribusi dalam persoalan ini. Seperti kata Jenifer Kiem Aviani, pengulas buku ini, “Kita bisa menggunakan kekuatan sebagai anak muda dan fasilitas yang kita miliki, dari segi ekonomi maupun pendidikan, untuk bersama-sama membangun negeri. Semoga dengan buku ini, anak muda di Indonesia semakin tergerak untuk berbagi pada sesama dengan ide-ide cemerlang.”',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
