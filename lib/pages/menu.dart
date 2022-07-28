import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/pages/admin/admin.dart';
import 'package:stunting/theme/color.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.logout_outlined,
          ),
          onPressed: () {},
        ),
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
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
          ),
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
}
