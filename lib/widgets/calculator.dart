import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';
import 'package:stunting/widgets/button.dart';
import 'package:stunting/widgets/text_field.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController bbController = TextEditingController();
  int bulansekarang = int.parse(DateTime.now().month.toString());
  int tahunsekarang = int.parse(DateTime.now().year.toString());
  int? bulanlahir;
  int? tahunlahir;
  int? umurtahun;
  int? umurbulan;
  DateTime sekarang = DateTime.now();
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor,
        title: Text(
          'Kalkulator Gizi',
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/calculate.png',
                width: 200,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tanggal Lahir',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.width * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Row(children: [
                          Text(
                            date != null ? date!.day.toString() : '00',
                            style: tanggalTextstyle,
                          ),
                          Text(
                            '-',
                            style: tanggalTextstyle,
                          ),
                          Text(
                            date != null ? date!.month.toString() : '00',
                            style: tanggalTextstyle,
                          ),
                          Text(
                            '-',
                            style: tanggalTextstyle,
                          ),
                          Text(
                            date != null ? date!.year.toString() : '0000',
                            style: tanggalTextstyle,
                          ),
                        ]),
                      ),
                      IconButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: date == null
                                ? DateTime.now()
                                : DateTime(date!.year, date!.month, date!.day),
                            firstDate: DateTime(1945),
                            lastDate: DateTime(DateTime.now().year + 10),
                          ).then(
                            (value) {
                              setState(() {
                                date = value;
                                bulanlahir = value!.month;
                                umurbulan = bulanlahir! - bulansekarang;
                                tahunlahir = value.year;
                                if (umurbulan! > 0) {
                                  umurtahun = tahunsekarang -
                                      int.parse(tahunlahir.toString()) +
                                      1;
                                } else {
                                  umurtahun = tahunsekarang -
                                      int.parse(tahunlahir.toString());

                                  umurbulan =
                                      12 + int.parse(umurbulan.toString());
                                }
                              });
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.calendar_month_sharp,
                          color: backgroundColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InputButtonWidget(
              obsuretext: false,
              controller: bbController,
              keyboard: TextInputType.number,
              label: "berat badan (Kg)",
            ),
            const SizedBox(
              height: 10,
            ),
            InputButtonWidget(
              obsuretext: false,
              controller: bbController,
              keyboard: TextInputType.number,
              label: "tinggi badan (cm)",
            ),
            CustomButtonWidget(
                text: 'Hitung',
                press: () {},
                buttonColor: yellowButtonColor,
                textColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
