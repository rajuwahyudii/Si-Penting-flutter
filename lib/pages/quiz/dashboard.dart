import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/button.dart';
import 'package:stunting/widgets/dashboard_widget.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              DashboardWidget(
                width: size.width * 0.9,
              ),
              CustomButtonWidget(
                  text: 'Menu',
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Menu(),
                      ),
                    );
                  },
                  buttonColor: yellowButtonColor,
                  textColor: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
