// ignore_for_file: unused_local_variable, prefer_final_fields, sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/button.dart';

// ignore: must_be_immutable
class EsaiSemua extends StatelessWidget {
  String id;
  EsaiSemua({
    required this.id,
    Key? key,
  }) : super(key: key);
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('user');
  TextEditingController _esai1Controller = TextEditingController();
  TextEditingController _esai2Controller = TextEditingController();
  TextEditingController _esai3Controller = TextEditingController();
  TextEditingController _esai4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<DocumentSnapshot>(
      future: collectionRef.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          var esaiPre = '${data['score pretest esai']}';
          var esaiPost = '${data['score postest esai']}';

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
                'Esai dari ${data['nama']}',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: Container(
              padding: const EdgeInsets.all(17),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: const Color.fromARGB(255, 2, 34, 55),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Soal Esai 1',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.9,
                            child: Text(
                                'Menurut anda, apa yang dimaksud dengan stunting?'),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Jawaban Pretest',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.9,
                            child: Text('${data['pretest esai1']}'),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Jawaban Postest',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.9,
                            child: Text('${data['postest esai1']}'),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      color: Color.fromARGB(255, 2, 34, 55),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Soal Esai 2',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.9,
                            child: Text(
                                'Menurut anda, bagaimana seseorang dikatakan stunting'),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Jawaban Pretest',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.9,
                            child: Text('${data['pretest esai2']}'),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Jawaban Postest',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: size.width * 0.9,
                            child: Text('${data['postest esai2']}'),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                17,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: CustomButtonWidget(
                          text: 'Beri Nilai',
                          press: () {
                            showDialog(
                              context: context,
                              builder: (context) => Center(
                                child: AlertDialog(
                                  contentPadding: const EdgeInsets.all(20),
                                  backgroundColor: backgroundColor,
                                  title: Text('Beri Nilai'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Niali Pretest soal 1'),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _esai1Controller,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Niali Postest soal 1'),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _esai2Controller,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Niali Pretest soal 2'),
                                        TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: _esai3Controller,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('Niali Postest soal 2'),
                                        TextFormField(
                                          controller: _esai4Controller,
                                          keyboardType: TextInputType.number,
                                        ),
                                        CustomButtonWidget(
                                            text: 'Submit',
                                            press: () async {
                                              await AuthServices.HasilTestEsai(
                                                      data['id'],
                                                      int.parse(_esai1Controller
                                                              .text) +
                                                          int.parse(
                                                              _esai2Controller
                                                                  .text),
                                                      int.parse(_esai3Controller
                                                              .text) +
                                                          int.parse(
                                                              _esai4Controller
                                                                  .text))
                                                  .then(
                                                (value) => ScaffoldMessenger.of(
                                                        context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(value != null
                                                        ? "Gagal Menilai Esai"
                                                        : "Berhasil Menilai Esai"),
                                                  ),
                                                ),
                                              );
                                              Navigator.pop(context);
                                            },
                                            buttonColor: yellowButtonColor,
                                            textColor: Colors.black)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          buttonColor: yellowButtonColor,
                          textColor: Colors.black),
                    )
                  ],
                ),
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
