// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/admin/admin.dart';
import 'package:stunting/pages/introduction.dart';
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
import 'package:stunting/widgets/calculator.dart';
import 'package:stunting/widgets/materi_menu.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Completer completer = Completer();
  int index = 1;
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User user = auth.currentUser!;
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('user');
  DateTime? date;
  int tb = 0;
  int bb = 0;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser!;
  }

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
          return data['new'] == true
              ? const Introduction()
              : Scaffold(
                  backgroundColor: backgroundColor,
                  appBar: AppBar(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        await AuthServices.signOut()
                            .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
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
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Wrapper(),
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
                                color: Colors.black,
                              ),
                            )
                          : const Text('')
                    ],
                    title: Text(
                      index == 1
                          ? "Menu"
                          : index == 2
                              ? 'Artikel'
                              : 'Kalkulator Gizi',
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
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
                                  : index == 2
                                      ? 'assets/images/artikel.png'
                                      : 'assets/images/calculate.png',
                              width: index != 3 ? 180 : 200,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: index == 2
                                ? Column(
                                    children: <Widget>[
                                      ArticleMenu(
                                        title:
                                            'Remaja Ternyata Memiliki Peran Penting dalam Mencegah Stunting',
                                        press: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Article1(),
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
                                              builder: (context) =>
                                                  const Article2(),
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
                                              builder: (context) =>
                                                  const Article3(),
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
                                              builder: (context) =>
                                                  const Article4(),
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
                                              builder: (context) =>
                                                  const Article5(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                : index == 1
                                    ? Column(
                                        children: [
                                          if (materi > 0)
                                            MateriMenu(
                                              title: 'Pre Test (Ganda)',
                                              isDone:
                                                  materi != 1 ? true : false,
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
                                          if (materi > 1)
                                            MateriMenu(
                                              title: 'Pre Test (Esai)',
                                              isDone:
                                                  materi != 2 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PretestEsaiMenu(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 2)
                                            MateriMenu(
                                              title: 'Pre Test (Sikap)',
                                              isDone:
                                                  materi != 3 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PretestSikapMenu(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 3)
                                            MateriMenu(
                                              title: 'Pre Test (Prilaku)',
                                              isDone:
                                                  materi != 4 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PretestPrilakuMenu(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 4)
                                            MateriMenu(
                                              title: 'Modul Stunting',
                                              isDone:
                                                  materi != 5 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi1(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 5)
                                            MateriMenu(
                                              title: 'Modul Anemia',
                                              isDone:
                                                  materi != 6 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi2(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 6)
                                            MateriMenu(
                                              title: 'Modul Gizi Seimbang',
                                              isDone:
                                                  materi != 7 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi3(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 7)
                                            MateriMenu(
                                              title: 'Modul Imunisasi',
                                              isDone:
                                                  materi != 8 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi4(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 8)
                                            MateriMenu(
                                              title: 'Modul Gizi Ibu Hamil',
                                              isDone:
                                                  materi != 9 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi5(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 9)
                                            MateriMenu(
                                              title: 'Modul Sanitasi',
                                              isDone:
                                                  materi != 10 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi6(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 10)
                                            MateriMenu(
                                              title: 'Modul Asi',
                                              isDone:
                                                  materi != 11 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi7(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 11)
                                            MateriMenu(
                                              title: 'Modul Pola Asuh Anak',
                                              isDone:
                                                  materi != 12 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Materi8(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 12)
                                            MateriMenu(
                                              title: 'Materi Tambahan',
                                              isDone:
                                                  materi != 13 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MateriTambahan(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 13)
                                            MateriMenu(
                                              title: 'Post Test (Ganda)',
                                              isDone:
                                                  materi != 14 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PostestGMenu(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 14)
                                            MateriMenu(
                                              title: 'Post Test (Esai)',
                                              isDone:
                                                  materi != 15 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PostestEsaiMenu(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 15)
                                            MateriMenu(
                                              title: 'Post Test (Sikap)',
                                              isDone:
                                                  materi != 16 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PostestSikapMenu(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 16)
                                            MateriMenu(
                                              title: 'Post Test (Prilaku)',
                                              isDone:
                                                  materi != 17 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PostestPrilakuMenu(),
                                                  ),
                                                );
                                              },
                                            ),
                                          if (materi > 17)
                                            MateriMenu(
                                              title: 'Hasil',
                                              isDone:
                                                  materi != 18 ? true : false,
                                              press: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Raport(),
                                                  ),
                                                );
                                              },
                                            ),
                                        ],
                                      )
                                    : const Calculator(),
                          )
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: Container(
                    color: redColor,
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
                                  color:
                                      index == 1 ? Colors.white : Colors.black,
                                  size: 25,
                                ),
                                Text(
                                  'Menu',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: index == 1
                                        ? Colors.white
                                        : Colors.black,
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
                                  color:
                                      index != 2 ? Colors.black : Colors.white,
                                  size: 25,
                                ),
                                Text(
                                  'Artikel',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: index != 2
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Calculator(),
                              ),
                            );
                            // setState(() {
                            //   index = 3;
                            // });
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ImageIcon(
                                  const AssetImage(
                                    'assets/images/timbangan.png',
                                  ),
                                  color:
                                      index != 3 ? Colors.black : Colors.white,
                                  size: 25,
                                ),
                                Text(
                                  'Kalkulator Gizi',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: index != 3
                                        ? Colors.black
                                        : Colors.white,
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
          color: redColor,
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
