import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/pages/quiz/pretestsikap.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/done_test.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/introduction_test.dart';
import 'package:stunting/widgets/list_article_widget.dart';

class PretestSikapMenu extends StatefulWidget {
  const PretestSikapMenu({Key? key}) : super(key: key);

  @override
  State<PretestSikapMenu> createState() => _PretestSikapMenuState();
}

class _PretestSikapMenuState extends State<PretestSikapMenu> {
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
                'Pretest Sikap',
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
                  if (materi > 3)
                    DoneTest(
                        introduction:
                            'Kamu Telah Menyelesaikan\n Pretest Sikap'),
                  if (materi < 4)
                    Column(
                      children: [
                        IntroductionTest(
                          introduction:
                              'Tandailah sesuai dengan sikap kamu terhadap setiap pernyataan. Isilah dengan jujur Keterangan:',
                        ),
                        const ListArticleWidget(
                          text: '1 = Sangat Tidak Setuju',
                        ),
                        const ListArticleWidget(
                          text: '2 = Tidak Setuju',
                        ),
                        const ListArticleWidget(
                          text: '3 =  Setuju',
                        ),
                        const ListArticleWidget(
                          text: '4 = Sangat Setuju',
                        ),
                        const SizedBox(
                          height: 50,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (materi < 4)
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
                            builder: (context) => const PretestSikap(),
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
