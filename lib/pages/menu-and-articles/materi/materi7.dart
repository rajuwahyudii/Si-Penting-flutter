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
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Materi7 extends StatefulWidget {
  const Materi7({Key? key}) : super(key: key);

  @override
  State<Materi7> createState() => _Materi7State();
}

class _Materi7State extends State<Materi7> {
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

          var role = '${data['role']}';
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
                        title: 'PERAN REMAJA DALAM PENCEGAHAN STUNTING',
                      ),
                      TextArticleWidget(
                        text:
                            'Remaja adalah salah satu sasaran utama upaya pencegahan stunting. Para remaja kelak akan mengambil peran sebagai orangtua. Oleh karena itu, mengajak para remaja agar lebih aktif berkontribusi terhadap upaya pencegahan stunting menjadi penting untuk dilakukan. Para remaja atau mahasiswa tidak hanya sekadar tahu dan mengerti mengenai stunting untuk dirinya pribadi, tapi sekaligus menjadi agen perubahan yang mampu menyebarkan informasi stunting lebih luas lagi kepada lingkungan sekitarnya. Ini harus dilakukan bersama sebagai upaya untuk menjadikan masyarakat Indonesia sehat, sejahtera. dan produktif. ',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      TextArticleWidget(
                        text:
                            'Pengguna aktif media sosial khususnya remaja di Indonesia sangat tinggi.  Mengingat data ini tercatat pada awal tahun 2020 sebelum pandemi terjadi, maka dapat diasumsikan bahwa waktu para remaja lebih banyak lagi dihabiskan untuk media sosial pada saat ini. Oleh karena itu, salah satu upaya pencegahan stunting dapat dilakukan dengan memanfaatkan media sosial. Memanfaatkan media sosial sebagai media penyebaran informasi mengenai stunting adalah salah satu cara yang efektif. ',
                      ),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      TextArticleWidget(
                        text:
                            'Media sosial yang paling sering diakses selanjutnya adalah WhatsApp sebesar 84%, Facebook sebesar 82%, dan Instagram 79%. Selain itu, ada media sosial baru yang cukup digemari pengguna internet di Indonesia, yaitu TikTok dengan jumlah pengguna sekitar 30,7 juta jiwa pengguna dari Indonesia menjadikan Indonesia menjadi negara pengguna TikTok terbesar keempat di dunia (Rayana, 2020). Begitu banyak pilihan media platform  sosial yang dapat digunakan untuk memberikan informasi dan pemahaman tentang stunting kepada masyarakat, terutama remaja.  Selain memanfaatkan media sosial untuk mengunggah informasi edukasi tentang stunting, media sosial juga dapat digunakan untuk menjawab berbagai informasi yang keliru tentang stunting.  ',
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: const <Widget>[
                        TextArticleWidget(
                          text:
                              'penggunaan pertanyaan "adiksimba" (apa, di mana, kapan, siapa, mengapa, bagaimana) dalam merangkai pesan untuk kampanye stunting dapat dijabarkan sebagai berikut: ',
                        ),
                        ListArticleWidget(
                          text:
                              'What? Pesan apa yang akan disampaikan? Pengertian stunting, dampak dan upaya pencegahan stunting. ',
                        ),
                        ListArticleWidget(
                          text:
                              'Where? Di mana kampanye ini dilakukan? Di media sosial untuk penyebaran informasi akan menjadi tempat bagi para remaja belajar lebih lanjut. ',
                        ),
                        ListArticleWidget(
                          text:
                              'When? Kapan isu mengenai stunting perlu diketahui dan dipelajari oleh masyarakat? Mulai dari remaja dan dilaksanakan ketika 1000 Hari Pertama Kehidupan anak ',
                        ),
                        ListArticleWidget(
                          text:
                              'Why?  Mengapa para remaja?  Sebab, mereka harus mengambil tindakan dan sebagai agen perubahan dalam upaya pencegahan stunting ini, karena remaja akan menjadi orangtua nantinya.',
                        ),
                        ListArticleWidget(
                          text:
                              'Who?  Siapa yang harus paham?  Semua orang harus paham mengenai hal ini, tapi remaja adalah target utama.',
                        ),
                        ListArticleWidget(
                          text:
                              'How?  Bagaimana peran remaja?  Mereka akan menjadi agen perubahan dengan ikut andil dalam kampanye ini.  Tidak terbatas untuk pengetahuan pribadi, namun diharapkan mampu menyebarluaskan informasi.',
                        ),
                        TextArticleWidget(
                          text:
                              'Sosialisasi tentang pentingnya pola asuh dalam pencegahan stunting bisa dilakukan dengan lebih ringan dan menarik bagi para remaja.  Disampaikan dengan cara yang menyenangkan, bahasa yang sederhana, dan mudah dipahami.  Dengan demikian remaja akan jauh lebih tertarik dan perlahan mulai tumbuh rasa keingintahuan mereka untuk mempelajari dan memahami stunting lebih jauh lagi.  ',
                        ),
                      ],
                    ),
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
                                      Text("Berhasil Menyelesaikan Materi 7"),
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
