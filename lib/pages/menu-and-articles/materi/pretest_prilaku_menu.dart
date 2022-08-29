import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/pages/quiz/pretestprilaku.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/done_test.dart';
import 'package:stunting/widgets/end_of_materi.dart';
import 'package:stunting/widgets/introduction_test.dart';
import 'package:stunting/widgets/list_article_widget.dart';

class PretestPrilakuMenu extends StatefulWidget {
  const PretestPrilakuMenu({Key? key}) : super(key: key);

  @override
  State<PretestPrilakuMenu> createState() => _PretestPrilakuMenuState();
}

class _PretestPrilakuMenuState extends State<PretestPrilakuMenu> {
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
                  color: Colors.black,
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
                'Pretest Prilaku',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
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
                  if (materi > 4)
                    DoneTest(
                        introduction:
                            'Kamu Telah Menyelesaikan\n Pretest Prilaku'),
                  if (materi < 5)
                    Column(
                      children: [
                        IntroductionTest(
                          introduction:
                              'Tandailah sesuai dengan prilaku kamu terhadap setiap pernyataan. Isilah dengan jujur Keterangan:',
                        ),
                        const ListArticleWidget(
                          text: '1 = Selalu',
                        ),
                        const ListArticleWidget(
                          text: '2 = Sering',
                        ),
                        const ListArticleWidget(
                          text: '3 =  Jarang',
                        ),
                        const ListArticleWidget(
                          text: '4 = Tidak Pernah',
                        ),
                        const SizedBox(
                          height: 50,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.arrow_right_alt_outlined,
                              color: Colors.black,
                              size: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (materi < 5)
                    EndOfMateri(
                      text: 'Mulai',
                      press: () async {
                        // ignore: use_build_context_synchronously
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PretestPrilaku(),
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
              color: Colors.black,
              size: 50,
            ),
          ),
        );
      },
    );
  }
}
