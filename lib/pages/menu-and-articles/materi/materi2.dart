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
import 'package:stunting/widgets/tittle_article_widget.dart';

class Materi2 extends StatefulWidget {
  const Materi2({Key? key}) : super(key: key);

  @override
  State<Materi2> createState() => _Materi2State();
}

class _Materi2State extends State<Materi2> {
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
                  if (materi < 7)
                    EndOfMateri(
                      text: 'Lanjut',
                      press: () async {
                        await AuthServices.nextMateri(7)
                            .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Berhasil Menyelesaikan Materi 2"),
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
