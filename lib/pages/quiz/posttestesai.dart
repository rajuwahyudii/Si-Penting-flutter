// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/common/services.dart';
import 'package:stunting/pages/menu.dart';
import 'package:stunting/theme/color.dart';
import 'package:stunting/widgets/finishscreen_esai.dart';

class PostestEsai extends StatefulWidget {
  const PostestEsai({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PostestEsaiState createState() => _PostestEsaiState();
}

class _PostestEsaiState extends State<PostestEsai> {
  int _index = 1;
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Container(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: _index < 3
                  ? Column(children: [
                      Container(
                        height: size.height / 3,
                        width: size.width,
                        padding: const EdgeInsets.all(5),
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: _index > 0 && _index == 1
                              ? const Text(
                                  'Menurut anda, apa yang dimaksud dengan stunting?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                )
                              : const Text(
                                  'Menurut anda, bagaimana seseorang dikatakan stunting',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300),
                                ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(246, 123, 144, 19),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        maxLength: 100,
                        controller: _index == 1 ? _controller1 : _controller2,
                        decoration: InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: Text(
                          'Submit',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        // ignore: unnecessary_null_comparison
                        onPressed: () async {
                          _index == 1
                              ? await AuthServices.PostestEsai1(
                                  _controller1.text)
                              : await AuthServices.PostestEsai2(
                                  _controller2.text);
                          setState(() {
                            _index++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: yellowButtonColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          textStyle: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ])
                  : FinishScreenEsai(
                      onPressed: () async {
                        await AuthServices.nextMateri(16);
                        // ignore: use_build_context_synchronously
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Menu(),
                          ),
                        );
                      },
                    ),
            ),
          )),
    );
  }
}
