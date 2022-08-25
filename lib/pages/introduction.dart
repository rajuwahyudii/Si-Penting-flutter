// ignore_for_file: use_build_context_synchronously, unused_local_variable, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/wrapper.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/animation.dart';
import 'package:stunting/widgets/button.dart';

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
            body: SizedBox(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TopAnime(
                      1,
                      20,
                      child: Text(
                        'Selamat Datang di \nSiPenting',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TopAnime(
                      2,
                      20,
                      child: Center(
                        child: Image.asset(
                          'assets/images/hello.png',
                          width: 300,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 5),
                    child: TopAnime(
                      2,
                      20,
                      child: Text(
                        'SiPenting adalah aplikasi pembelajaran mengenai stunting, ',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TopAnime(
                      2,
                      20,
                      child: CustomButtonWidget(
                        text: 'Mulai',
                        press: () async {
                          await AuthServices.IsNew(false);
                          await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wrapper(),
                            ),
                          );
                        },
                        buttonColor: yellowButtonColor,
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        }
        return Container(
            color: backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[],
              ),
            ));
      },
    );
  }
}
