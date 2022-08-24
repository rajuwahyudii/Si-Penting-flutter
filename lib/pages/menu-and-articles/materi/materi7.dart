import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/end_of_materi.dart';

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
                'Modul Asi',
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
                    'assets/images/asi1.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi2.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi3.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi4.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi5.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi6.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi7.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi8.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi9.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi10.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi11.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi12.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi13.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi14.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi15.jpg',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi16.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi17.png',
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/asi18.jpg',
                    width: 10,
                  ),
                  if (materi < 12)
                    EndOfMateri(
                      text: 'Lanjut',
                      press: () async {
                        await AuthServices.nextMateri(12)
                            .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Berhasil Menyelesaikan Modul Asi"),
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
