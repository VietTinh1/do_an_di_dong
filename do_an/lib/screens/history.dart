import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an/model/fieldModel.dart';
import 'package:do_an/model/roundPlayModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:do_an/main.dart';
import 'package:do_an/screens/google_sig_in.dart';
import 'package:provider/provider.dart';
import 'package:do_an/screens/display_page.dart';

class HistoryPage extends StatefulWidget {
  @override
  _RankChoosePage createState() => _RankChoosePage();
}

class _RankChoosePage extends State<HistoryPage> {
  //hide/show password
  String name = '';
  String uid = '';
  List<RoundPlay> lstRoundPlay = [];
  @override
  void initState() {
    super.initState();
    setState(() {});
    getUser();
  }

  final user = FirebaseAuth.instance.currentUser;
  String customDatetime(DateTime x) {
    String convertedDateTime =
        "${x.hour.toString().padLeft(2, '0')}:${x.minute.toString().padLeft(2, '0')}:${x.second.toString().padLeft(2, '0')}  ${x.day.toString()}-${x.month.toString().padLeft(2, '0')}-${x.year.toString().padLeft(2, '0')} ";
    return convertedDateTime;
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        // print(this.widget.ChooseField.name_field);
        setState(() {
          name = documentSnapshot["name"];
          print(name);
          uid = documentSnapshot["uid"];
        });
        //    print(uid);
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Widget field(String name, String point, DateTime date,String a) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround ,
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
            Text(
              point,
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
            ),
            Text(
              customDatetime(date),
              style: const TextStyle(
                  color: Color.fromARGB(255, 137, 26, 26), fontSize: 18),
            ),
            Text(
              a,
              style: const TextStyle(
                  color: Color.fromARGB(255, 137, 26, 26), fontSize: 18),
            ),
          ],
        ));
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
                        ' Lịch sử chơi',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'Người chơi',
                            style: TextStyle(
                                color: Color.fromARGB(255, 116, 24, 158),
                                fontSize: 18),
                          ),
                          Text(
                            'Điểm',
                            style: TextStyle(
                                color: Color.fromARGB(255, 116, 24, 158),
                                fontSize: 18),
                          ),
                          Text(
                            'Ngày giờ ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 116, 24, 158),
                                fontSize: 18),
                          ),
                          Text(
                            'Lĩnh vực',
                            style: TextStyle(
                                color: Color.fromARGB(255, 116, 24, 158),
                                fontSize: 18),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      //  _namePoint(name),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Stack(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("roundplay")
                                .where("uid", isEqualTo: uid)
  
                               .orderBy("date",descending: true)
    
                                .snapshots()
                                ,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final data = snapshot.data!.docs;

                                for (var row in data) {
                                  final r = row.data() as Map<String, dynamic>;
                                  // ignore: unused_local_variable
                                  RoundPlay data = RoundPlay.fromJson(r);
                                  lstRoundPlay.add(data);
                                }
                                // ignore: avoid_print
                                // print("${lstField.length}");
                                return ListView.builder(
                                    //  scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    //  physics: const ScrollPhysics(),
                                    itemCount: lstRoundPlay.length,
                                    itemBuilder: (context, index1) {
                                      return Column(
                                        children: <Widget>[
                                          field(
                                              lstRoundPlay[index1]
                                                  .name
                                                  .toString(),
                                              lstRoundPlay[index1]
                                                  .point
                                                  .toString(),
                                              lstRoundPlay[index1]
                                                  .date
                                                  .toDate(),
                                                  lstRoundPlay[index1].field

                                                ),
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
