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
import 'package:stunting/pages/menu-and-articles/materi/pretest_g_menu.dart';
import 'package:stunting/pages/quiz/quis2.dart';
import 'package:stunting/pages/quiz/start_quiz.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/article_menu.dart';
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
          var materi = int.parse('${data['class']}');
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                ),
                onPressed: () async {
                  await AuthServices.signOut()
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Berhasil Logout"),
                          ),
                        ),
                      )
                      .onError(
                        (error, stackTrace) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Gagal Logout"),
                          ),
                        ),
                      );
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
                                if (materi > -1)
                                  MateriMenu(
                                    title: 'Pre Test (Ganda)',
                                    isDone: materi != 0 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PretestGMenu(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 0)
                                  MateriMenu(
                                    title: 'Materi 1',
                                    isDone: materi != 1 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Materi1(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 1)
                                  MateriMenu(
                                    title: 'Materi 2',
                                    isDone: materi != 2 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Materi2(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 2)
                                  MateriMenu(
                                    title: 'Materi 3',
                                    isDone: materi != 3 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Materi3(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 3)
                                  MateriMenu(
                                    title: 'Materi 4',
                                    isDone: materi != 4 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Materi4(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 4)
                                  MateriMenu(
                                    title: 'Materi 5',
                                    isDone: materi != 5 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Materi5(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 5)
                                  MateriMenu(
                                    title: 'Materi 6',
                                    isDone: materi != 6 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Materi6(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 6)
                                  MateriMenu(
                                    title: 'Materi 7',
                                    isDone: materi != 7 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Materi7(),
                                        ),
                                      );
                                    },
                                  ),
                                if (materi > 7)
                                  MateriMenu(
                                    title: 'Post Test',
                                    isDone: materi != 8 ? true : false,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => StartQuiz(
                                            press: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const QuizScreen(),
                                                ),
                                              );
                                            },
                                            text: 'Start Quiz',
                                          ),
                                        ),
                                      );
                                    },
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
