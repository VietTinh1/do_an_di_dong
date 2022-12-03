import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an/model/fieldModel.dart';
import 'package:do_an/model/userModel.dart';
import 'package:do_an/screens/forgot_password_page.dart';
import 'package:do_an/screens/rankhistory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:do_an/main.dart';
import 'package:do_an/screens/google_sig_in.dart';
import 'package:provider/provider.dart';
import 'package:do_an/screens/display_page.dart';

class RankChoosePage extends StatefulWidget {
  @override
  _RankChoosePage createState() => _RankChoosePage();
}

class _RankChoosePage extends State<RankChoosePage> {
  //hide/show password
  List<Field> lstField = [];
  UserModel lstUser = UserModel(name: '', id: '');
  String name = '';
  late int index;
  String uid = '';

  @override
  void initState() {
    super.initState();
  }
  Widget field(String x, Field y) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RankHistoryPage(chooseField1: y)));
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          backgroundColor: const Color.fromARGB(232, 194, 205, 120),
          shadowColor: const Color.fromARGB(255, 48, 146, 90),
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          shape: const StadiumBorder(),
        ),
        child: Text(
          x,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget _namePoint(String x) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          x,
          style:
              TextStyle(color: Color.fromARGB(255, 116, 24, 158), fontSize: 18),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 197, 197, 200),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        ' Chọn lĩnh vực',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      _namePoint(name),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Stack(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("field")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final data = snapshot.data!.docs;

                                for (var row in data) {
                                  final r = row.data() as Map<String, dynamic>;
                                  // ignore: unused_local_variable
                                  Field data = Field.fromJson(r);
                                  lstField.add(data);
                                }
                                // ignore: avoid_print
                                // print("${lstField.length}");
                                return ListView.builder(
                                    //  scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    //  physics: const ScrollPhysics(),
                                    itemCount: lstField.length,
                                    itemBuilder: (context, index1) {
                                      return Column(
                                        children: <Widget>[
                                          field(
                                              lstField[index1]
                                                  .name_field
                                                  .toString(),
                                              lstField[index1]),
                                        ],
                                      );
                                    });
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text(e.toString()),
                                );
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
