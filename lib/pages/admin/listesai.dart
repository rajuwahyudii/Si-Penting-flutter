// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stunting/pages/admin/esaisemua.dart';
import 'package:stunting/theme/color.dart';

class ListEsai extends StatefulWidget {
  ListEsai({Key? key}) : super(key: key);

  @override
  State<ListEsai> createState() => _ListEsaiState();
}

class _ListEsaiState extends State<ListEsai> {
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
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text('List Hasil',
              style: GoogleFonts.poppins(color: Colors.black)),
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
                          builder: (context) => EsaiSemua(id: doc['id']),
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
              return const Text("No data");
            }
          },
        ));
  }
}
