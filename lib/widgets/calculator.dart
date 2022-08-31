// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/models/zscore.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/theme/font.dart';
import 'package:stunting/widgets/button.dart';
import 'package:stunting/widgets/hasilcal.dart';
import 'package:stunting/widgets/text_field.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController bbController = TextEditingController();
  TextEditingController tbController = TextEditingController();
  int bulansekarang = int.parse(DateTime.now().month.toString());
  int tahunsekarang = int.parse(DateTime.now().year.toString());
  int? bulanlahir;
  int? tahunlahir;
  int? umurtahun;
  int? umurbulan;
  double? imt;
  DateTime sekarang = DateTime.now();
  DateTime? date;
  int? rate;
  int isMale = 1;
  check(double imt, int umurtahun, int umurbulan) {
    for (var i = 1; i <= zScore.length; i++) {
      if (isMale == i) {
        for (var i = 5; i < 19; i++) {
          if (umurtahun == i) {
            for (var i = 0; i < 12; i++) {
              if (umurbulan == i) {
                if (imt >=
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['-3'] &&
                    imt <=
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['-2']) {
                  setState(() {
                    rate = 1;
                  });
                } else if (imt >
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['-2'] &&
                    imt <=
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['+1']) {
                  setState(() {
                    rate = 2;
                  });
                } else if (imt >
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['+1'] &&
                    imt <=
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['+2']) {
                  setState(() {
                    rate = 3;
                  });
                } else if (imt >
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['+2'] &&
                    imt <=
                        zScore[isMale - 1]['imt'][umurtahun - 5]['zscore']
                            [umurbulan]['+3']) {
                  setState(() {
                    rate = 4;
                  });
                } else {
                  setState(() {
                    rate = 0;
                  });
                }
              }
            }
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Menu()));
          },
        ),
        backgroundColor: backgroundColor,
        title: Text(
          'Kalkulator Gizi 5-18 tahun',
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
                    color: Colors.black,
                  ),
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.width * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                  ),
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
                              setState(
                                () {
                                  date = value;
                                  bulanlahir = value!.month;
                                  umurbulan = bulanlahir! - bulansekarang;
                                  tahunlahir = value.year;
                                  if (umurbulan! > 0) {
                                    umurtahun = tahunsekarang -
                                        int.parse(tahunlahir.toString());
                                  } else if (umurbulan == 0) {
                                    umurtahun = tahunsekarang -
                                        int.parse(tahunlahir.toString());

                                    umurbulan = int.parse(umurbulan.toString());
                                  } else {
                                    umurtahun = tahunsekarang -
                                        int.parse(tahunlahir.toString()) -
                                        1;

                                    umurbulan =
                                        12 + int.parse(umurbulan.toString());
                                  }
                                },
                              );
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
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    'Jenis Kelamin',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: isMale,
                            onChanged: (value) {
                              setState(() {
                                isMale = value as int;
                              });
                            },
                          ),
                          Text(
                            'Laki-laki',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: isMale,
                            onChanged: (value) {
                              setState(() {
                                isMale = value as int;
                              });
                            },
                          ),
                          Text(
                            'Perempuan',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          )
                        ],
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
              controller: tbController,
              keyboard: TextInputType.number,
              label: "tinggi badan (cm)",
            ),
            CustomButtonWidget(
                text: 'Hitung',
                press: () async {
                  try {
                    setState(() {
                      imt = double.parse(bbController.text) /
                          ((double.parse(tbController.text) / 100) *
                              (double.parse(tbController.text) / 100));
                    });
                    await Future.delayed(
                      const Duration(seconds: 1),
                    );

                    await check(imt!, umurtahun!, umurbulan!);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => rate != null
                            ? HasilCal(
                                isMale: isMale,
                                rate: rate!,
                                umurbulan: umurbulan!,
                                umurtahun: umurtahun!,
                                imt: imt!,
                              )
                            : HasilCal(
                                isMale: isMale,
                                imt: imt!,
                                umurtahun: umurtahun!,
                                umurbulan: umurbulan!),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(" Input Data Kurang"),
                      ),
                    );
                  }
                },
                buttonColor: yellowButtonColor,
                textColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
