import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Article2 extends StatelessWidget {
  const Article2({Key? key}) : super(key: key);

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
                title:
                    'Mencegah Stunting Dimulai dari Masa Remaja, Begini caranya!',
              ),
              SizedBox(
                height: 30,
              ),
              TextArticleWidget(
                text:
                    'Biasanya pembahasan stunting selalu dikaitkan dengan ibu hamil, ASI eksklusif, dan pola makan pada periode emas pertumbuhan anak. Ini tentu nggak salah. Karena 1.000 Hari Pertama Kehidupan (HPK) adalah window of opportunity, atau masa di mana ibu bisa memaksimalkan kesehatan dan perkembangan anak melalui asupan gizi yang baik. ',
              ),
              TextArticleWidget(
                text:
                    'Yang dimaksud masa 1.000 Hari Pertama Kehidupan adalah masa 9 bulan kehamilan hingga anak usia 2 tahun. Namun sebenarnya untuk melahirkan anak yang sehat, sebelum masa 1.000 HPK terjadi, yaitu pada masa remaja, calon ibu harus sudah memerhatikan asupan gizinya. ',
              ),
              TextArticleWidget(
                text:
                    'Lalu apa yang perlu dilakukan untuk mencegah stunting? Berikut beberapa hal yang perlu diperhatikan para remaja putri seperti kamu:  ',
              ),
              SubtitleArtikelWidget(
                title: 'Penuhi kebutuhan nutrisi harian',
              ),
              TextArticleWidget(
                text:
                    'Salah satu langkah awal cegah stunting adalah memastikan kebutuhan nutrisi harianmu terpenuhi. Tidak salah untuk diet, asalkan diet yang benar. Pada dasarnya, diet bukan tidak makan, tapi mengatur pola makan. Untuk itu agar langsing, namun sehat, GenBest harus tetap konsumsi makanan sehat dengan gizi seimbang. Coba terapkan metode Isi Piringku. Metode ini akan membantumu makan secukupnya, namun tetap sehat. Contohnya dengan mengisi setengah isi piringmu dengan sayur dan buah yang kaya vitamin. Kemudian seperempatnya dengan protein hewani dan nabati. Jangan lupa untuk mengisi sisanya dengan karbohidrat kompleks sebagai sumber energi dan minum air putih minimal 8 gelas sehari, ya, Genbest.',
              ),
              SubtitleArtikelWidget(
                title: 'Konsumsi tablet tambah darah (TTD)',
              ),
              TextArticleWidget(
                text:
                    'Terkait dengan siklus menstruasi setiap bulan, remaja putri seperti kamu jadi lebih mudah terkena anemia. Anemia juga terkadang disebabkan diet yang terlalu ketat. Masalahnya, anemia yang tidak teratasi dan terbawa hingga saat hamil nanti bisa berpengaruh pada calon bayi dan meningkatkan risiko terkena stunting. ',
              ),
              TextArticleWidget(
                text:
                    'Buat yang sering merasakan gejala anemia seperti mudah lelah, mata berkunang, hingga pusing sebaiknya mulai mengonsumsi tablet tambah darah (TTD). Tidak hanya zat besi, TTD juga mengandung asam folat yang berguna menurunkan risiko kelahiran bayi cacat nantinya.  Untuk mengurangi rasa mual, hindari minum TTD saat perut kosong. Barengi konsumsi TTD ini dengan makanan beragam dan bergizi seimbang, termasuk yang mengandung zat besi.',
              ),
              SubtitleArtikelWidget(
                title: 'Biasakan Perilaku Hidup Bersih dan Sehat',
              ),
              TextArticleWidget(
                text:
                    'Perilaku Hidup Bersih dan Sehat merupakan salah satu cara efektif untuk mencegah terkena segala macam penyakit. Selalu biasakan mencuci tangan dengan sabun dan air mengalir setelah bepergian dari luar serta sebelum dan setelah makan, ya.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
