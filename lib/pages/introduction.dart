// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/admin/admin.dart';
import 'package:stunting/pages/menu-and-articles/articles/article1.dart';
import 'package:stunting/pages/menu-and-articles/articles/article2.dart';
import 'package:stunting/pages/menu-and-articles/articles/article3.dart';
import 'package:stunting/pages/menu-and-articles/articles/article4.dart';
import 'package:stunting/pages/menu-and-articles/articles/article5.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi1.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi2.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi3.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi4.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi5.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi6.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi7.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi8.dart';
import 'package:stunting/pages/menu-and-articles/materi/materi_tambahan.dart';
import 'package:stunting/pages/menu-and-articles/materi/postest_esai_menu.dart';
import 'package:stunting/pages/menu-and-articles/materi/postest_g_menu.dart';
import 'package:stunting/pages/menu-and-articles/materi/postest_prilaku.dart';
import 'package:stunting/pages/menu-and-articles/materi/postest_sikap_menu.dart';
import 'package:stunting/pages/menu-and-articles/materi/pretest_esai_menu.dart';
import 'package:stunting/pages/menu-and-articles/materi/pretest_g_menu.dart';
import 'package:stunting/pages/menu-and-articles/materi/pretest_prilaku_menu.dart';
import 'package:stunting/pages/menu-and-articles/materi/pretest_sikap_menu.dart';
import 'package:stunting/pages/quiz/raport.dart';
import 'package:stunting/pages/wrapper.dart';

import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/article_menu.dart';
import 'package:stunting/widgets/materi_menu.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int index = 1;
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
            body: SizedBox(child: SingleChildScrollView(child: Text(''))),
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
