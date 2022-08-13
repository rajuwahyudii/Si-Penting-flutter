import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Materi3 extends StatefulWidget {
  const Materi3({Key? key}) : super(key: key);

  @override
  State<Materi3> createState() => _Materi3State();
}

class _Materi3State extends State<Materi3> {
  PageController pageController = PageController();
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User user = auth.currentUser!;
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<DocumentSnapshot>(
      future: collectionRef.doc(user.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          var materi = int.parse('${data['class']}');
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ),
                  );
                },
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
                  ),
                  Column(
                    children: const <Widget>[
                      SubtitleArtikelWidget(
                        title: 'Jarak Kelahiran',
                      ),
                      TextArticleWidget(
                        text:
                            'Jarak kelahiran mempengaruhi pola asuh orangtua terhadap anaknya. Jarak kelahiran dekat membuat orangtua cenderung lebih kerepotan sehinga kurang optimal dalam merawat anak Jarak kelahiran kurang dari dua tahun juga menyebabkan salah satu anak, biasanya yang lebih tua tidak mendapatkan ASI yang cukup karena ASI lebih diutamakan untuk adiknya. Akibat tidak memperoleh ASI dan kurangya asupan makanan, anak akan menderita malnutrisi yang bisa menyebabkan stunting.',
                      ),
                      TextArticleWidget(
                          text:
                              'Untuk mengatasi hal ini program Keluarga Berencana harus kembali digalakkan. Setelah melahirkan, ibu atau ayah harus dihimbau supaya secepat mungkin menggunakan alat kontrasepsi untuk mencegah kehamilan. Banyak orangtua yang enggan menggunakan kontrasepsi segera setelah kelahiran anaknya, sehingga terjadi kehamilan yang sering tidak disadari sampai kehamilan tersebut sudah menginjak usia beberapa bulan. ')
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      TextArticleWidget(
                        text:
                            'Jarak kehamilan yang terlalu dekat, selain kurang baik untuk anak yang baru dilahirkan juga kurang baik untuk ibu. Kesehatan ibu dapat terganggu karena kondisi fisik yang belum sempurna setelah melahirkan sekaligus harus merawat bayi yang membutuhkan waktu dan perhatian sangat besar. Ibu hamil yang tidak sehat akan menyebabkan gangguan pada janin yang dikandungnya. Gangguan pada janin dalam kandungan juga akan mengganggu pertumbuhan sehingga timbullah stunting.',
                      ),
                      SubtitleArtikelWidget(
                        title: 'Riwayat BBLR',
                      ),
                      TextArticleWidget(
                        text:
                            'Berat badan lahir rendah menandakan janin mengalami malnutrisi di dalam kandungan sedangkan underweight menandakan kondisi malnutrisi yang akut. Stunting sendiri terutama disebabkan oleh malnutrisi yang lama. Bayi yang lahir dengan berat badan kurang dari normal (<2500 gr) mungkin masih memiliki panjang badan normal pada waktu dilahirkan. Stunting baru akan terjadi beberapa bulan kemudian, walaupun hal ini sering tidak disadari oleh orangtua. ',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      TextArticleWidget(
                        text:
                            'Orang tua baru mengetahui bahwa anaknya stunting umumnya setelah anak mulai bergaul dengan temantemannya sehingga terlihat anak lebih pendek dibanding teman-temannya. Oleh karena itu anak yang lahir dengan berat badan kurang atau anak yang sejak lahir berat badannya di bawah normal harus diwaspadai akan menjadi stunting. Semakin awal dilakukan penanggulangan malnutrisi maka semakin kecil risiko menjadi stunting.',
                      ),
                      SubtitleArtikelWidget(
                        title: 'Anemia pada Ibu',
                      ),
                      TextArticleWidget(
                        text:
                            'Anemia pada ibu hamil sebagian besar disebabkan oleh defisiensi zat gizi mikro terutama zat besi. Akibat defisiensi zat besi pada ibu hamil akan mempengaruhi pertumbuhan dan perkembangan janin sehingga janin yang dilahirkan sudah malnutrisi. Malnutrisi pada bayi jika tidak segera diatasi akan menetap sehingga menimbulkan malnutrisi kronis yang merupakan penyebab stunting. Ibu hamil dengan anemia memiliki resiko yang lebih besar untuk melahirkan bayi dengan berat di bawah normal dikarenakan anemia dapat mengurangi suplai oksigen pada metabolisme ibu sehingga dapat terjadi proses kelahiran imatur (bayi prematur). ',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      TextArticleWidget(
                        text:
                            'Pengaruh metabolisme yang tidak optimal juga terjadi pada bayi karena kekurangan kadar hemoglobin untuk mengikat oksigen, sehingga kecukupan asupan gizi selama di dalam kandungan kurang dan bayi lahir dengan berat di bawah normal. Beberapa hal di atas juga dapat mengakibatkan efek fatal, yaitu kematian pada ibu saat proses persalinan atau kematian neonatal.',
                      ),
                      SubtitleArtikelWidget(
                        title: 'Hygiene Dan Sanitasi Lingkungan',
                      ),
                      TextArticleWidget(
                        text:
                            'Studi yang disertakan menunjukkan bahwa mikotoksin bawaan makanan, kurangnya sanitasi yang memadai, lantai tanah di rumah, bahan bakar memasak berkualitas rendah, dan pembuangan limbah lokal yang tidak memadai terkait dengan peningkatan risiko pengerdilan anak. Akses ke sumber air yang aman telah dipelajari dalam sejumlah besar studi, tetapi hasilnya tetap inklusif karena temuan studi yang tidak konsisten. Studi terbatas tersedia untuk arsenik, merkuri, dan tembakau lingkungan, dan dengan demikian peran mereka dalam pengerdilan tetap tidak meyakinkan. ',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      TextArticleWidget(
                        text:
                            'Penelitian yang diidentifikasi tidak mengontrol asupan gizi. Sebuah model kausal mengidentifikasi penggunaan bahan bakar padat dan mikotoksin bawaan makanan sebagai faktor risiko lingkungan yang berpotensi memiliki efek langsung pada pertumbuhan anak.',
                      ),
                      SubtitleArtikelWidget(
                        title: 'Defisiensi Zat Gizi',
                      ),
                      TextArticleWidget(
                        text:
                            'Zat gizi sangat penting bagi pertumbuhan. Pertumbuhan adalah peningkatan ukuran dan massa konstituen tubuh. Pertumbuhan adalah salah satu hasil dari metabolisme tubuh.Metabolisme didefinisikan sebagai proses dimana organisme hidup mengambil dan mengubah zat padat dan cair asing yang diperlukan untuk pemeliharaan kehidupan, pertumbuhan, fungsi normal organ, dan produksi energi. ',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      TextArticleWidget(
                        text:
                            'Asupan zat gizi yang menjadi faktor risiko terjadinya stunting dapat dikategorikan menjadi 2 yaitu asupan zat gizi makro atau mkronutrien dan asupan zat gizi mikro atau mikronutrien.15 Berdasarkan hasil-hasil penelitian, asupan zat gizi makro yang paling mempengaruhi terjadinya stunting adalah asupan protein, sedangkan asupan zat gizi mikro yang paling mempengaruhi kejadian stunting adalah asupan kalsium, seng, dan zat besi.',
                      ),
                    ],
                  ),
                  if (materi < 8)
                    EndOfMateri(
                      text: 'Lanjut',
                      press: () async {
                        await AuthServices.nextMateri(8)
                            .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Berhasil Menyelesaikan Materi 3"),
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
        return Container(
          color: backgroundColor,
          child: Center(
            child: LoadingAnimationWidget.waveDots(
              color: Colors.white,
              size: 50,
            ),
          ),
        );
      },
    );
  }
}
