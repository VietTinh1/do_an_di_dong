// import 'package:do_an/screens/forgot_password_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:do_an/main.dart';
// import 'package:do_an/screens/google_sig_in.dart';
// import 'package:provider/provider.dart';
// import 'package:do_an/screens/display_page.dart';

// class ChooseFieldPage extends StatefulWidget {
//   @override
//   _ChooseFieldState createState() => _ChooseFieldState();
// }

// class _ChooseFieldState extends State<ChooseFieldPage> {
//   //hide/show password

//   Widget _namePoint() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'Tên: Nguyễn Hồ Minh Tài',
//             style: TextStyle(color: Colors.black, fontSize: 18),
//           ),
//         ),
//         TextButton(
//           onPressed: () {},
//           child: Text(
//             'Điểm: 10',
//             style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _questionToan() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => DisplayPage()));
//         },
//         style: ElevatedButton.styleFrom(
//           elevation: 20,
//           shadowColor: Colors.black,
//           padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           primary: Color.fromARGB(232, 171, 183, 67),
//           shape: StadiumBorder(),
//         ),
//         child: Text(
//           "Môn Toán",
//           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Widget _questionVan() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => DisplayPage()));
//         },
//         style: ElevatedButton.styleFrom(
//           elevation: 20,
//           shadowColor: Colors.black,
//           padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           primary: Color.fromARGB(223, 123, 154, 0),
//           shape: StadiumBorder(),
//         ),
//         child: Text(
//           "Môn Văn",
//           style: TextStyle(color: Color.fromARGB(247, 15, 0, 0), fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Widget _questionAnh() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => DisplayPage()));
//         },
//         style: ElevatedButton.styleFrom(
//           elevation: 20,
//           shadowColor: Colors.black,
//           padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           primary: Color.fromARGB(179, 179, 210, 4),
//           shape: StadiumBorder(),
//         ),
//         child: Text(
//           "Anh Văn",
//           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Widget _questionLy() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => DisplayPage()));
//         },
//         style: ElevatedButton.styleFrom(
//           elevation: 20,
//           shadowColor: Colors.black,
//           padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           primary: Color.fromARGB(229, 158, 89, 5),
//           shape: StadiumBorder(),
//         ),
//         child: Text(
//           "Môn Lý",
//           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Widget _questionHoa() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => DisplayPage()));
//         },
//         style: ElevatedButton.styleFrom(
//           elevation: 20,
//           shadowColor: Colors.black,
//           padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           primary: Color.fromARGB(213, 139, 61, 28),
//           shape: StadiumBorder(),
//         ),
//         child: Text(
//           "Môn Hóa",
//           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Widget _questionLichSu() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => DisplayPage()));
//         },
//         style: ElevatedButton.styleFrom(
//           elevation: 20,
//           shadowColor: Colors.black,
//           padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           primary: Color.fromARGB(244, 226, 128, 41),
//           shape: StadiumBorder(),
//         ),
//         child: Text(
//           "Môn Lịch Sử",
//           style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromARGB(0, 197, 197, 200),
//                       Color(0xFF61A4F1),
//                       Color(0xFF478DE0),
//                       Color(0xFF398AE5),
//                     ],
//                     stops: [0.1, 0.4, 0.7, 0.9],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: double.infinity,
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 35.0,
//                     vertical: 120.0,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       // Image.asset('img/HA2.jpg',width: 150, height: 150,),
//                       Text(
//                         'Chọn Lĩnh Vực',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       // SizedBox(height: 20.0),
//                       SizedBox(
//                         height: 30.0,
//                       ),
//                       _namePoint(),
//                       _questionToan(),
//                       _questionVan(),
//                       _questionAnh(),
//                       _questionLy(),
//                       _questionHoa(),
//                       _questionLichSu()
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:ffi';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an/model/fieldModel.dart';
import 'package:do_an/model/listQuestionModel.dart';
import 'package:do_an/model/userModel.dart';
import 'package:do_an/screens/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:do_an/main.dart';
import 'package:do_an/screens/google_sig_in.dart';
import 'package:provider/provider.dart';
import 'package:do_an/screens/display_page.dart';

class ChooseFieldPage extends StatefulWidget {
  @override
  _ChooseFieldState createState() => _ChooseFieldState();
}

class _ChooseFieldState extends State<ChooseFieldPage> {
  //hide/show password
  final user = FirebaseAuth.instance.currentUser!;
  List<Field> lstField = [];
  late int index;
  String name = '';
  String uid = '';
  @override
  void initState() {
    super.initState();
    random();
    getUser();
    checkListQuestion();
  }

  var lst;
  List<ListQuestion> lst_List_Q = [];
  String Now =
      '${DateTime.now().day < 10 ? '0${DateTime.now().day}' : '${DateTime.now().day}'}${DateTime.now().month}${DateTime.now().year}';
  void checkListQuestion() {
    FirebaseFirestore.instance
        .collection('listquestion')
        .doc(Now)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document data: ${documentSnapshot.data()}');
       lst = documentSnapshot["list_Question"];
        print(lst[9]);
      } else {
        print(Now);
        addListQuestion();
      }
    });
  }

  List<int> lstQuestion = [];
  Set<int> lstQ = Set<int>();
  List<int> random() {
    for (int j = 1; j < 50; j++) {
      int x = Random().nextInt(15) + 1;
      lstQ.add(x);
      if (lstQ.length == 10) break;
    }
    lstQuestion = lstQ.toList();
    // print(lstQuestion);
    return lstQuestion;
  }

  CollectionReference listQuestion =
      FirebaseFirestore.instance.collection('listquestion');
  Future<void> addListQuestion() {
    return listQuestion
        .doc(Now)
        .set({
          'id_List_Question': Now,
          'list_Question': lstQuestion,
          'date': DateTime.now(),
        })
        .then((value) => print("List quetion has ADDED"))
        .catchError((error) => print("Failed : $error"));
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document data: ${documentSnapshot.data()}');
        name = documentSnapshot["name"];
        uid = documentSnapshot["uid"];
      } else {
        print('Document does not exist on the database');
      }
    });
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
                  builder: (context) => DisplayPage(ChooseField1: y)));
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
        )
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
                      //   check_ListQ(),
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
                                return ListView.builder(
                                    shrinkWrap: true,
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
