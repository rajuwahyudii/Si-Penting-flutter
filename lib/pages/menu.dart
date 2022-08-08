import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/models/materi_model.dart';
import 'package:stunting/pages/admin/admin.dart';
import 'package:stunting/pages/menu-and-articles/articles/article1.dart';
import 'package:stunting/pages/menu-and-articles/articles/article2.dart';
import 'package:stunting/pages/menu-and-articles/articles/article3.dart';
import 'package:stunting/pages/menu-and-articles/articles/article4.dart';
import 'package:stunting/pages/menu-and-articles/articles/article5.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/article_menu.dart';
import 'package:stunting/widgets/card_menu.dart';
import 'package:stunting/widgets/materi_menu.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
          var materi = 5;
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                ),
                onPressed: () async {
                  AuthServices.signOut();
                },
              ),
              backgroundColor: backgroundColor,
              actions: [
                role == 'admin'
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.admin_panel_settings,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    : const Text('')
              ],
              title: Text(
                index == 1 ? 'Menu' : 'Artikel',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Image.asset(
                        index == 1
                            ? 'assets/images/menu.png'
                            : 'assets/images/artikel.png',
                        width: 180,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: index != 1
                          ? Column(
                              children: <Widget>[
                                ArticleMenu(
                                  title:
                                      'Remaja Ternyata Memiliki Peran Penting dalam Mencegah Stunting',
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Article1(),
                                      ),
                                    );
                                  },
                                ),
                                ArticleMenu(
                                  title:
                                      'Mencegah Stunting Dimulai dari Masa Remaja, Begini caranya!',
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Article2(),
                                      ),
                                    );
                                  },
                                ),
                                ArticleMenu(
                                  title:
                                      'Mengatasi Stunting Dari Kaca Mata Remaja',
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Article3(),
                                      ),
                                    );
                                  },
                                ),
                                ArticleMenu(
                                  title:
                                      'Saatnya Remaja Turut Dilibatkan untuk Cegah Stunting',
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Article4(),
                                      ),
                                    );
                                  },
                                ),
                                ArticleMenu(
                                  title: 'Cegah Stunting Itu Penting!',
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Article5(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                if (materi > 0)
                                  MateriMenu(
                                    number: 1,
                                    isDone: materi != 1 ? true : false,
                                  ),
                                if (materi > 1)
                                  MateriMenu(
                                    isDone: materi != 2 ? true : false,
                                    number: 2,
                                  ),
                                if (materi > 2)
                                  MateriMenu(
                                    isDone: materi != 3 ? true : false,
                                    number: 3,
                                  ),
                                if (materi > 3)
                                  MateriMenu(
                                    isDone: materi != 4 ? true : false,
                                    number: 4,
                                  ),
                                if (materi > 4)
                                  MateriMenu(
                                    isDone: materi != 5 ? true : false,
                                    number: 5,
                                  )
                              ],
                            ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              color: buttonBlueColor,
              width: size.width,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            const AssetImage(
                              'assets/images/monitor.png',
                            ),
                            color: index == 1 ? Colors.white : Colors.black,
                            size: 25,
                          ),
                          Text(
                            'Menu',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: index == 1 ? Colors.white : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            const AssetImage(
                              'assets/images/menu-icn-white.png',
                            ),
                            color: index == 1 ? Colors.black : Colors.white,
                            size: 25,
                          ),
                          Text(
                            'Artikel',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: index == 1 ? Colors.black : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
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
