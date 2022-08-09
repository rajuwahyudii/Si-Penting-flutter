import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/list_article_widget.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Materi5 extends StatefulWidget {
  const Materi5({Key? key}) : super(key: key);

  @override
  State<Materi5> createState() => _Materi5State();
}

class _Materi5State extends State<Materi5> {
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
                    children: const <Widget>[
                      TitleArticelWidget(
                        title: 'Pencegahan Stunting',
                      ),
                      ListArticleWidget(
                        text: 'Perbaikan terhadap pola makan (gizi)',
                      ),
                      ListArticleWidget(
                        text: 'Perbaikan pola asuh',
                      ),
                      ListArticleWidget(
                        text: 'Perbaikan sanitasi dan akses air bersih',
                      ),
                      TextArticleWidget(
                        text:
                            'Penangan stunting dilakukan melalui Intervensi Spesifik dan Intervensi Sensitif pada sasaran 1.000 hari pertama kehidupan seorang anak sampai berusia 6 tahun.',
                      ),
                      SubtitleArtikelWidget(
                        title: 'Intervensi Gizi Spesifik',
                      ),
                      TextArticleWidget(
                        text:
                            'Ini merupakan intervensi yang ditujukan kepada anak dalam 1.000 Hari Pertama Kehidupan (HPK) dan berkontribusi pada 30% penurunan stunting. Kerangka kegiatan intervensi gizi spesifik umumnya dilakukan pada sektor kesehatan.',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      SubtitleArtikelWidget(
                        title: 'Intervensi dengan sasaran Ibu Hamil:',
                      ),
                      ListArticleWidget(
                        text:
                            'Memberikan makanan tambahan pada ibu hamil untuk mengatasi kekurangan energi dan protein kronis.',
                      ),
                      ListArticleWidget(
                        text: 'Mengatasi kekurangan zat besi dan asam folat.',
                      ),
                      ListArticleWidget(
                        text: 'Mengatasi kekurangan iodium.',
                      ),
                      ListArticleWidget(
                        text: 'Menanggulangi kecacingan pada ibu hamil.',
                      ),
                      ListArticleWidget(
                        text: 'Melindungi ibu hamil dari Malaria.',
                      ),
                      SubtitleArtikelWidget(
                        title:
                            'Intervensi dengan sasaran Ibu Menyusui dan Anak Usia 0-6 Bulan:',
                      ),
                      ListArticleWidget(
                        text:
                            'Mendorong inisiasi menyusui dini (pemberian ASI jolong/colostrum).',
                      ),
                      ListArticleWidget(
                        text: 'Mendorong pemberian ASI Eksklusif.',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      SubtitleArtikelWidget(
                        title:
                            'Intervensi dengan sasaran Ibu Menyusui dan Anak Usia 7-23 bulan:',
                      ),
                      ListArticleWidget(
                        text:
                            'Mendorong penerusan pemberian ASI hingga usia 23 bulan didampingi oleh pemberian MP-ASI.',
                      ),
                      ListArticleWidget(
                        text: 'Menyediakan obat cacing.',
                      ),
                      ListArticleWidget(
                        text: 'Menyediakan suplementasi zink.',
                      ),
                      ListArticleWidget(
                        text:
                            'Melakukan fortifikasi zat besi ke dalam makanan.',
                      ),
                      ListArticleWidget(
                        text: 'Memberikan perlindungan terhadap malaria.',
                      ),
                      ListArticleWidget(
                        text: 'Memberikan imunisasi lengkap.',
                      ),
                      SubtitleArtikelWidget(
                        title: 'Intervensi Gizi Sensitif',
                      ),
                      TextArticleWidget(
                        text:
                            'Idealnya dilakukan melalui berbagai kegiatan pembangunan diluar sektor kesehatan dan berkontribusi pada 70% Intervensi Stunting. Sasaran dari intervensi gizi spesifik adalah masyarakat secara umum dan tidak khusus ibu hamil dan balita pada 1.000 Hari PertamaKehidupan (HPK).',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      ListArticleWidget(
                        text:
                            'Menyediakan dan Memastikan Akses pada Air Bersih.',
                      ),
                      ListArticleWidget(
                        text: 'Menyediakan dan Memastikan Akses pada Sanitasi.',
                      ),
                      ListArticleWidget(
                        text: 'Melakukan Fortifikasi Bahan Pangan.',
                      ),
                      ListArticleWidget(
                        text:
                            'Menyediakan Akses kepada Layanan Kesehatan dan Keluarga Berencana (KB).',
                      ),
                      ListArticleWidget(
                        text: 'Menyediakan Jaminan Kesehatan Nasional (JKN).',
                      ),
                      ListArticleWidget(
                        text:
                            'Menyediakan Jaminan Persalinan Universal (Jampersal).',
                      ),
                      ListArticleWidget(
                        text:
                            'Memberikan Pendidikan Pengasuhan pada Orang tua.',
                      ),
                      ListArticleWidget(
                        text: 'Memberikan Pendidikan Anak Usia Dini Universal.',
                      ),
                      ListArticleWidget(
                        text: 'Memberikan Pendidikan Gizi Masyarakat.',
                      ),
                      ListArticleWidget(
                        text:
                            'Memberikan Edukasi Kesehatan Seksual dan Reproduksi, serta Gizi pada Remaja.',
                      ),
                      ListArticleWidget(
                        text:
                            'Menyediakan Bantuan dan Jaminan Sosial bagi Keluarga Miskin.',
                      ),
                      ListArticleWidget(
                        text: 'Meningkatkan Ketahanan Pangan dan Gizi.',
                      ),
                    ],
                  ),
                  if (materi < 6)
                    EndOfMateri(
                      text: 'Lanjut',
                      press: () async {
                        await AuthServices.nextMateri(6)
                            .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Berhasil Menyelesaikan Materi 5"),
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
