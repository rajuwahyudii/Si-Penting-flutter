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
                'Modul Anemia',
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
                    'assets/images/anemia1.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia2.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia3.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia4.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia5.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia6.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia7.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia8.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia9.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia10.jpg',
                    width: 10,
                  ),
                  // Image.asset(
                  //   'assets/images/anemia11.jpg',
                  //   width: 10,
                  // ),
                  Image.asset(
                    'assets/images/anemia12.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia13.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia14.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia15.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/anemia16.jpg',
                    width: 10,
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
                                  content: Text(
                                      "Berhasil Menyelesaikan Modul Anemia"),
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
