import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Article4 extends StatelessWidget {
  const Article4({Key? key}) : super(key: key);

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
                title: 'Saatnya Remaja Turut Dilibatkan untuk Cegah Stunting',
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/artikel4-1.jpg',
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const TextArticleWidget(
                text:
                    'STUNTING masih menjadi isu besar bagi bangsa Indonesia. Upaya menurunkan angka stunting terus dilakukan dengan melibatkan berbagai pihak, pemerintah maupun swasta. Remaja adalah kelompok usia potensial yang bisa dilibatkan dalam berbagai program pencegahan stunting sejak dini.',
              ),
              const TextArticleWidget(
                text:
                    '“Untuk mencapai misi tersebut, kami berupaya memaksimalkan potensi tumbuh kembang sesuai usia anak, karena kami yakin setiap anak bisa memiliki perkembangan otak yang pesat,” jelas  Indiana Basitha, Program Advocacy and Communications Manager Tanoto Foundation, pada seri webinar yang bertema "Saatnya Remaja Cegah Stunting", Rabu (26/8).',
              ),
              const TextArticleWidget(
                text:
                    'Mengapa remaja turut dilibatkan dalam mencegah stunting? Menurut Basitha, banyak yang menyangka isu stunting hanya untuk orangtua dan pasangan yang sudah menikah.Padahal sebenarnya stunting, tegas Basitha, adalah sebuah siklus. Jika calon ibu punya asupan gizi kurang sejak remaja ia berisiko mempunyai anak kurang gizi dan si anak akan mencontoh pola makan ibunya dan terus berputar.“Siklusnya dimulai sejak remaja putri. Maka masalah stunting harus jadi awareness sejak remaja agar mereka menjaga asupan gizinya, karena ia adalah calon orangtua," jelas Basitha.',
              ),
              const SubtitleArtikelWidget(
                title: 'Data stunting pada remaja',
              ),
              const TextArticleWidget(
                text:
                    'Data Riset Kesehatan Dasar (Risekdas) 2018 menunjukkan, 8,7% remaja usia 13-15 tahun dan 8,1% remaja usia 16-18 berada dalam kondisi kurus dan sangat kurus.Global Health survei 2015 menunjukkan, penyebabnya antara lain remaja jarang sarapan, 93%kurang makan serat sayur buah. Ditambah angka pernikahan remaja di Indonesia tinggi, padahal hal ini berkontribusi pada kejadian stunting."Remaja belum aware pentingnya gizi dan stimulasi yang tepat. Pengetahuan mereka sangat terbatas tapi mereka harus menikah, hamil dan jadi ibu," jelas Melinda Mastan, salah satu penerima Tanoto Scholars angkatan 2017.Melinda menambahkan, penting untuk melibatkan remaja dalam penanggulangan stunting karena beberapa alasan. Pertama, remaja berada di garis depan dalam inovasi dan agen perubahan.“Saat ini eranya diambil alih oleh anak muda. Banyak inovasi dikembangkan anak muda yang sudah memulainya sejak remaja. Dari merekalah inovasi lahir karena mereka masih memiliki semangat, idealisme, dan kreativitas tinggi,” jelas sarjana Gizi dari Fakultas Kedokteran Universitas Indonesia (FKUI) ini.Oleh karena itu, remaja bisa menjadi pintu masuk untuk pengembangan program. “Remaja juga calon orangtua masa depan. Penelitian menyebutkan, status gizi ibu akan berpengaruh pada anaknya. Status gizi ibu ini sudah dibangun sejak mereka remaja, sehingga perilaku dan kebiasaan hidup yang sehat sudah harus dibangun sejak remaja,” tambah Melinda.Pengamat kesehatan dr. Reisa Broto Asmoro juga sependapat bahwa jika di masa remaja belum dapat ilmu tentang gizi, akan sulit ke depannya dalam kehidupan keluarga.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
