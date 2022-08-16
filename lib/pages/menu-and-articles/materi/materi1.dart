import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class Materi1 extends StatefulWidget {
  const Materi1({Key? key}) : super(key: key);

  @override
  State<Materi1> createState() => _Materi1State();
}

class _Materi1State extends State<Materi1> {
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
                'Modul Stunting',
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
                  Image.asset(
                    'assets/images/stunting1.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting2.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting3.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting4.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting5.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting6.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting7.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting8.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting9.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting10.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting11.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting12.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting13.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting14.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting15.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting16.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting17.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting18.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting19.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting20.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting21.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting22.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting23.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting24.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting25.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting26.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting27.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting28.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/stunting29.jpg',
                    width: 10,
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
                                      Text("Berhasil Menyelesaikan Materi 1"),
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
