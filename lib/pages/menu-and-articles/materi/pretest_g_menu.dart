import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/pages/quiz/pretestg.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/done_test.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/introduction_test.dart';
import 'package:stunting/widgets/sub_judul_artikel_widget.dart';
import 'package:stunting/widgets/text_article_widget.dart';
import 'package:stunting/widgets/tittle_article_widget.dart';

class PretestGMenu extends StatefulWidget {
  const PretestGMenu({Key? key}) : super(key: key);

  @override
  State<PretestGMenu> createState() => _PretestGMenuState();
}

class _PretestGMenuState extends State<PretestGMenu> {
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
                'Pretest Pilihan Ganda',
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
                  if (materi > 0)
                    DoneTest(
                        introduction:
                            'Kamu Telah Menyelesaikan\n Pretest Pilihan Ganda'),
                  if (materi < 1)
                    IntroductionTest(
                      introduction:
                          'Pilihlah jawaban yang paling kamu anggap benar! Isilah secara jujur karena ini tidak akan mempengaruhi nilai kamu atau apapun. ini hanya untuk melihat gambaran pengetahuan kamu sebelum terpapar dengan materi di dalam aplikasi.',
                    ),
                  if (materi < 1)
                    EndOfMateri(
                      text: 'Mulai',
                      press: () async {
                        // await AuthServices.nextMateri(1)
                        //     .then(
                        //       (value) =>
                        //           ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: Text("Berhasil Menyelesaikan Prete"),
                        //         ),
                        //       ),
                        //     )
                        //     .onError(
                        //       (error, stackTrace) =>
                        //           ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //           content: Text("Permintaan Gagal"),
                        //         ),
                        //       ),
                        //     );
                        // ignore: use_build_context_synchronously
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PretestG(),
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
