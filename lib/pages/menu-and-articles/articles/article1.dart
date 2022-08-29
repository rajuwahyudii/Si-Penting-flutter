import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Article1 extends StatelessWidget {
  const Article1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
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
            color: Colors.black,
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
                title:
                    'Remaja Ternyata Memiliki Peran Penting dalam Mencegah Stunting',
              ),
              const SizedBox(
                height: 30,
              ),
              const TextArticleWidget(
                text:
                    'Stunting masih menjadi masalah penting yang perlu diwaspadai oleh para orangtua di Indonesia. Hal ini karena stunting atau masalah tubuh perawakan pendek tersebut merupakan salah satu gangguan pertumbuhan pada anak-anak. ',
              ),
              const TextArticleWidget(
                text:
                    'Dikutip laman resmi Ikatan Dokter Anak Indonesia (IDAI), sebagian besar stunting disebabkan oleh masalah nutrisi. Sudah sepatutnya, orangtua bekerja sama dengan dokter spesialis anak dalam memantau kebutuhan nutrisi anak agar masalah stunting tidak terjadi. ',
              ),
              const TextArticleWidget(
                text:
                    'Namun, tidak hanya menjadi tanggung jawab para orangtua atau pasangan yang sudah menikah saja. Anak-anak remaja pun memiliki peran yang cukup penting dalam mencegah stunting, lho.',
              ),
              const TitleArticelWidget(
                title: '1. Remaja berperan dalam cegah stunting',
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/artikel1-1.png',
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const TextArticleWidget(
                text:
                    'Terdapat alasan tersendiri mengapa para remaja berperan penting dalam pencegahan stunting, Ma. Hal ini karena remaja merupakan kelompok yang memiliki andil besar dalam menghasilkan keturunan di masa depan. ',
              ),
              const TextArticleWidget(
                text:
                    'Dengan adanya edukasi mengenai konsep berkeluarga serta anak-anak, remaja diharapkan dapat menjadi orangtua yang memiliki keturunan sehat dan anti stunting. Jadi, keterlibatan remaja dalam pencegahan stunting ini sangat penting untuk diperhatikan. ',
              ),
              const TitleArticelWidget(
                title: '2. Perlunya edukasi tentang keluarga pada remaja',
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/artikel1-2.png',
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const TextArticleWidget(
                text:
                    'Meski memiliki peran yang penting dalam pencegahan stunting, tetapi edukasi mengenai stunting pada remaja ini masih belum dilaksanakan dengan maksimal. Di tempat belajar, seperti sekolah, tidak ada pelajaran khusus mengenai parenting terutama stunting sehingga para remaja cenderung tidak tahu. ',
              ),
              const TextArticleWidget(
                text:
                    'Untuk itu, apabila Mama dan Papa memiliki remaja di rumah, sudah sebaiknya memberikan edukasi terkait konsep keluarga, cara pengasuhan, serta pendidikan anak. Dengan begitu, para remaja bisa lebih tahu, lebih siap, dan lebih mampu dalam bertanggungjawab pada rumah tangganya kelak. ',
              ),
              const TextArticleWidget(
                text:
                    'Menurut Dr. Reisa Broto Asmoro, edukasi yang mendalam tentang keluarga pada remaja sangat perlu dilakukan. Mengingat angka pernikahan remaja di Indonesia masih cukup tinggi. ',
              ),
              const TextArticleWidget(
                text:
                    'Berdasarkan data Riskesdas pada tahun 2018, jumlah remaja yang menikah di bawah usia 16 tahun mencapai angka 15,66% dan angka ini justru meningkat dibandingkan data sebesar 14,18% di tahun 2017. Padahal, pernikahan usia remaja cukup berisiko karena bisa saja menimbulkan beberapa dampak berikut:',
              ),
              const ListArticleWidget(
                  text: 'meningkatkan risiko kematian ibu dan bayi,'),
              const ListArticleWidget(
                text:
                    'kehamilan di bawah usia 20 tahun dapat menimbulkan risiko pendarahan, anemia, preeklampsia dan eklampsia, infeksi saat hamil, dan keguguran,',
              ),
              const ListArticleWidget(
                text:
                    "hamil pada usia 10–14 tahun memiliki risiko 5x lebih besar,",
              ),
              const ListArticleWidget(
                text: 'berisiko melahirkan prematur,',
              ),
              const ListArticleWidget(
                text: 'berisiko mengalami stunting, dan',
              ),
              const ListArticleWidget(
                text:
                    'ketidakstabilan emosi pada remaja dapat menimbulka Kekerasan Dalam Rumah Tangga (KDRT).',
              ),
              const TitleArticelWidget(
                title: '3. Kebiasaan sehat yang perlu diterapkan remaja',
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/artikel1-3.png',
                width: 300,
              ),
              const TextArticleWidget(
                text:
                    'Demi terciptanya generasi yang sehat dan anti stunting, sebaiknya dimulai dari kebiasaan para remajanya itu sendiri. Di Indonesia, terdapat 7 langkah gerakan remaja sehat yang mungkin dapat orangtua terapkan, yaitu:',
              ),
              const SubtitleArtikelWidget(
                title: 'perbanyak aktivitas fisik',
              ),
              const TextArticleWidget(
                text:
                    'Aktivitas fisik merupakan salah satu kebiasaan sehat yang perlu diajarkan pada remaja. Mama atau Papa mungkin dapat memulainya dengan mengajak remaja berolahraga bersama. Setidaknya, selama 30 menit setiap hari. ',
              ),
              const SubtitleArtikelWidget(
                title: 'makan buah dan sayur',
              ),
              const TextArticleWidget(
                text:
                    'Remaja masih termasuk dalam masa pertumbuhan sehingga dibutuhkan makanan yang bergizi seimbang agar mereka tumbuh dengan optimal. Untuk itu, sebisa mungkin rutin mengonsumsi buah dan sayur, serta dilengkapi dengan asupan nutrisi lainnya. ',
              ),
              const SubtitleArtikelWidget(
                title: 'tidak merokok',
              ),
              const TextArticleWidget(
                text:
                    'Beri pemahaman pada remaja mengenai bahaya rokok agar mereka tidak melakukannya, Ma. Dikutip dari laman resmi Kemenkes RI, merokok dapat berbahaya bagi kesehatan remaja. Mulai dari menyebabkan gangguan terkait pendidikan di sekolah, insomnia, plak pada gigi, masalah pernafasan, hingga bisa menimbulkan kecanduan. ',
              ),
              const SubtitleArtikelWidget(
                title: 'tidak minum alkohol',
              ),
              const TextArticleWidget(
                text:
                    'Edukasi juga remaja untuk tidak mengonsumsi minuman beralkohol. Hal ini karena alkohol dapat memengaruhi perkembangan otak. Biasanya, seseorang yang minum alkohol akan mengalami perubahan perilaku, seperti halusinasi, kehilangan keseimbangan, dan berpikir lebih lambat sehingga dapat membahayakan dirinya. ',
              ),
              const SubtitleArtikelWidget(
                title: 'menjaga kebersihan lingkungan',
              ),
              const TextArticleWidget(
                text:
                    'Dengan membiasakan remaja untuk menjaga kebersihan lingkungan, risiko infeksi atau penyakit pun dapat dihindari. ',
              ),
              const SubtitleArtikelWidget(
                title: 'menggunakan jamban bersih',
              ),
              const TextArticleWidget(
                text:
                    'Ketersediaan air bersih serta sanitasi yang baik, seperti menggunakan jamban bersih merupakan salah satu upaya dalam menjaga kesehatan. Khususnya, kesehatan diri sendiri secara keseluruhan. ',
              ),
              const SubtitleArtikelWidget(
                title: 'rutin cek kesehatan',
              ),
              const TextArticleWidget(
                text:
                    'Jangan lupa juga mengajarkan remaja untuk rutin melakukan cek kesehatan sehingga tubuh dapat senantiasa dalam keadaan yang baik, Ma. ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
