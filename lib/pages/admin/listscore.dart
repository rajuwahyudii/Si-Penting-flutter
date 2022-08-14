import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stunting/pages/admin/hasil_semua.dart';
import 'package:stunting/theme/color.dart';

class ListScore extends StatefulWidget {
  ListScore({Key? key}) : super(key: key);

  @override
  State<ListScore> createState() => _ListScoreState();
}

class _ListScoreState extends State<ListScore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          centerTitle: true,
          title: const Text('List Hasil'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('user').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HasilSemua(id: doc['id']),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: size.width * 0.6,
                      height: size.height * 0.1,
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: Text(
                          doc['nama'],
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text("No data");
            }
          },
        ));
  }
}
