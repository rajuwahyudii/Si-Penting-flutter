import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';

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
                'Modul Gizi Seimbang',
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
                    'assets/images/giziseimbang.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang1.png',
                    width: 10,
                  ),
                  // Image.asset(
                  //   'assets/images/giziseimbang2.png',
                  //   width: 10,
                  // ),
                  Image.asset(
                    'assets/images/giziseimbang3.jpg',
                    width: 10,
                  ),
                  // Image.asset(
                  //   'assets/images/giziseimbang4.jpg',
                  //   width: 10,
                  // ),
                  Image.asset(
                    'assets/images/giziseimbang5.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang6.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang7.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang8.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang9.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang10.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang11.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang12.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang13.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang14.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang15.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang16.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang17.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang18.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang19.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang20.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang21.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/giziseimbang22.png',
                    width: 10,
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
                                  content: Text(
                                      "Berhasil Menyelesaikan Modul Gizi Seimbang"),
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
