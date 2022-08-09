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

class Materi6 extends StatefulWidget {
  const Materi6({Key? key}) : super(key: key);

  @override
  State<Materi6> createState() => _Materi6State();
}

class _Materi6State extends State<Materi6> {
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
                  title: 'GIZI SEIMBANG UNTUK REMAJA',
                ),
                const SubtitleArtikelWidget(
                  title: 'Gizi Seimbang',
                ),
                Image.asset(
                  'assets/images/materi6.jpg',
                  width: 200,
                ),
                const TextArticleWidget(
                  text:
                      'Remaja adalah suatu tahap peralihan dari anak-anak menjadi dewasa. Masa ini biasanya diawali pada usia 14 tahun pada laki-laki dan 10 tahun pada perempuan. Kondisi penting yang berpengaruh terhadap kebutuhan zat gizi kelompok ini pertumbuhan cepat memasuki usia pubertas, kebiasaan jajan, menstruasi dan perhatian terhadap penampilan fisik citra tubuh (body image) dan dampaknya pada masalah gizi saat dewasa. Saat ini populasi remaja di dunia telah mencapai 1200 juta jiwa atau sekitar 19% dari total populasi dunia. ',
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                TextArticleWidget(
                  text:
                      'Masa remaja merupakan periode dari pertumbuhan dan proses kematangan manusia, pada masa ini terjadi perubahan yang berkelanjutan. Oleh karena itu sering disebut periode remaja merupakan periode kritis dimana terjadi perubahan fisik, biokimia, dan emosional yang cepat. Pada masa ini terjadi growth spurt yaitu puncak pertumbuhan tinggi badan (peak weight velocity). Kecepatan pertumbuhan tinggi badan rata-rata mencapai 20 cm/tahun pada laki-laki dan 16 cm/tahun pada perempuan. ',
                ),
                TextArticleWidget(
                  text:
                      'Demikian pula kecepatan berat badan rata-rata mencapai 20 kg/tahun pada laki-laki dan 16 kg/tahun pada perempuan. Kecepatan pertumbuhan dan tinggi badan meliputi pada masa remaja ini lebih besar dibandingkan pertumbuhan tinggi badan dan berat badan pada anak-anak (usia 2 sampai 10) yang rata-rata hanya 5-6 cm/tahun dan 2-3 Kg/tahun. Selain itu pada masa ini juga terdapat puncak pertumbuhan masa tulang (peak bone mass/PBM) yang menyebabkan kebutuhan gizi pada masa ini sangat tinggi bahkan lebih tinggi fase kehidupan lainnya. ',
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                TextArticleWidget(
                  text:
                      'Khususnya pada remaja puteri, perhatian harus lebih ditekankan terhadap persiapan mereka sebelum menikah. Pada masa remaja akan mencoba hal yang baru. Seperti zaman sekarang ini yang penuh teknologi remaja memiliki kebiasaan berkumpul dengan genk di tempat-tempat yang dianggap trend dan biasanya remaja akan lebih suka mengonsumsi makanan cepat saji. Kebiasaan makan remaja umumnya dibentuk di keluarga, namun pengaruh perilaku makan di luar rumah cukup besar.',
                ),
                TextArticleWidget(
                  text:
                      'Saat ini banyak sekali iklan makanan ditayangkan berupa makanan kaya gula, karbohidrat, lemak di televisi. Hal ini tentu saja berpengaruh besar terhadap pilihan makan remaja dan makanan siap santap (fast food) yang sangat mudah didapat juga mempengaruhi kebiasaan makan remaja. Kebiasaan makan yang salah akan terbawa ke masa kehidupan selanjutnya. Makanan makanan cepat saji perlahan-lahan mulai menggeser makanan tradisional. ',
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                TextArticleWidget(
                  text:
                      'Makanan tradisional sudah mulai menghilang karena remaja Indonesia lebih memilih makanan modern dan cepat saji seperti burger, pizza, kentang goreng, pasta, nugget, sosis. Makanan tradisional seperti gado-gado, ketoprak, pecal sudah sangat jarang dikonsumsi oleh remaja. Tidak jarang kita menemukan remaja baik laki-laki maupun perempuan mengalami obesitas. Kecenderungan remaja lebih menyukai makanan yang manis, tinggi lemak dan banyak mengandung garam tinggi seperti snack, kue-kue kering dan fast food. ',
                ),
                TextArticleWidget(
                  text:
                      'Asupan serat yang rendah juga merupakan salah satu penyebab obesitas remaja. Beberapa penelitian menyimpulkan bahwa rasa merupakan alasan utama sulitnya remaja untuk meningkatkan asupan serat, khususnya sayuran. Sayuran dikaitkan dengan rasa negatif dan tidak menyenangkan bagi remaja, seperti pahit, asam, tidak memiliki rasa, lunak dan membosankan. Kalsium merupakan mineral dengan jumlah terbesar yang terdapat dalam tubuh. ',
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                TextArticleWidget(
                  text:
                      'Peranan mineral kalsium pada masa pertumbuhan remaja sangat penting. Di negara-negara maju seperti Amerika dan Australia angka kecukupan kalsium yang dianjurkan bagi remaja adalah sebesar 1200-1500 mg/hari. Remaja putri memiliki risiko sepuluh kali besar untuk menderita anemia dibandingkan dengan remaja putra. Hai ini dapat dimengerti karena remaja putri mengalami menstruasi setiap bulannya dan sedang alam masa pertumbuhan sehingga membutuhkan asupan zat besi yang lebih banyak. ',
                ),
                TextArticleWidget(
                  text:
                      'Selain itu ketidakseimbangan asupan zat gizi menjadi penyebab anemia pada remaja. Kebanyakan dari remaja putri sangat memperhatikan bentuk tubuhnya dan berat badan sehingga para remaja ini membatasi konsumsi makanan dan membuat pantangan sendiri untuk menjaga tubuh mereka. Akibatnya asupan mereka akan berkurang, sehingga cadangan zat besi dibongkar untuk pemenuhan kebutuhan.Apabila keadaan ini berlanjut akan mempercepat anemia.',
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                SubtitleArtikelWidget(
                  title: 'Masalah Gizi pada Remaja',
                ),
                ListArticleWidget(
                  text: 'Gangguan makan',
                ),
                ListArticleWidget(
                  text: 'Obesitasn',
                ),
                ListArticleWidget(
                  text: 'Anemia',
                ),
                ListArticleWidget(
                  text: 'KEK',
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const SubtitleArtikelWidget(
                  title: 'Contoh Menu',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/jadwal_makan.png',
                  ),
                )
              ],
            ),
            EndOfMateri(
              text: 'Lanjut',
              press: () async {
                await AuthServices.nextMateri(7)
                    .then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Berhasil Menyelesaikan Materi 6"),
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
