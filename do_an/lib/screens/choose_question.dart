// import 'package:do_an/model/questionModel.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class ChooseQuestion extends StatefulWidget {
//   List<Question> lstQuestion;
//   ChooseQuestion({Key? key, required this.lstQuestion}) : super(key: key);

//   @override
//   // ignore: no_logic_in_create_state
//   State<ChooseQuestion> createState() =>
//       _ChooseQuestionState(lstQuestion: lstQuestion);
// }

// class _ChooseQuestionState extends State<ChooseQuestion> {
//   _ChooseQuestionState({required this.lstQuestion});
//   List<Question> lstQuestion;
//   String answer = '';
//   int round = 0;
//   int second = 30;
//   bool stop = false;
//   int numQuestion = 0;
//   Question question = Question(
//       idQuestion: '', content: '', answer: '', a: '', b: '', c: '', d: '',field: '');

//   void onLoading() {
//     setState(() {
//       question = lstQuestion[0];
//       numQuestion = lstQuestion.length;
//       // if (lstQuestion.isEmpty) {
//       //   Future.delayed(Duration(seconds: 1), onLoading);
//       // } else {
//       //   question = lstQuestion[0];
//       //   numQuestion = lstQuestion.length;
//       // }
//     });
//   }

//   void countdown() {
//     setState(() {
//       if (second > 0) {
//         if (!stop) {
//           second -= 1;
//           Future.delayed(Duration(seconds: 1), countdown);
//         }
//       } else {
//         notification("Bạn đã hết thời gian", "Ok để thoát", false);
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     onLoading();
//     countdown();
//   }

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
//             '${round + 1}/$numQuestion',
//             style: TextStyle(color: Colors.black, fontSize: 18),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _questionText(String x) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 13.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           // elevation: 20,
//           // shadowColor: Colors.black,
//           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           backgroundColor: Color.fromARGB(255, 171, 183, 67),
//           shape: const StadiumBorder(),
//         ),
//         child: Text(
//           x,
//           style: TextStyle(color: Colors.black, fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Widget _answer(String x) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: () {
//           setState(() {
//             answer = x;
//           });

//           if (question.answer == x && answer == x) {
//             if (round < numQuestion - 1) {
//               notification("Câu trả lời của bạn đúng", "Ok để tiếp tục", true);
//             } else {
//               notification("Bạn đã chiến thắng!", "Ok để tiếp tục", false);
//             }
//           } else {
//             notification(
//                 "Câu trả lời của bạn sai", "Bạn nên dừng lại, hic", false);
//           }
//         },
//         style: ElevatedButton.styleFrom(
//           elevation: 15,
//           shadowColor: Colors.black,
//           backgroundColor: question.answer == x && answer == x
//               ? Colors.green
//               : answer == x
//                   ? Colors.orange
//                   : Colors.white,
//           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//           shape: const StadiumBorder(),
//         ),
//         child: Text(
//           x,
//           style: TextStyle(color: Color(0xFF6CA8F1), fontSize: 18),
//         ),
//       ),
//     );
//   }

//   Widget _time() {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.all(7),
//         decoration: BoxDecoration(
//           color: Color.fromARGB(255, 204, 214, 232),
//           border: Border.all(width: 1.0),
//           borderRadius: const BorderRadius.all(Radius.circular(100)),
//         ),
//         child: Text(
//           '$second',
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 30,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }

//   Future notification(String title, String content, bool check) {
//     stop = true;
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         backgroundColor: Colors.white,
//         title: Text(title),
//         content: Text(content),
//         actions: [
//           Align(
//             alignment: Alignment.center,
//             child: OutlinedButton(
//                 child: const Text("Ok"),
//                 onPressed: () {
//                   setState(() {});
//                   Navigator.pop(context);
//                   stop = false;
//                   if (check) {
//                     if (round < numQuestion - 1) {
//                       answer = '';
//                       round += 1;
//                       second = 30;
//                       question = lstQuestion[round];
//                       countdown();
//                     }
//                   } else {
//                     Navigator.pop(context);
//                   }
//                 }),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView(
//         children: [
//           Image.asset(
//             'img/HA2.jpg',
//             width: 150,
//             height: 150,
//           ),
//           const SizedBox(
//             height: 25.0,
//           ),
//           _namePoint(),
//           _questionText(question.content),
//           _answer(question.a),
//           _answer(question.b),
//           _answer(question.c),
//           _answer(question.d),
//           const SizedBox(
//             height: 10.0,
//           ),
//           _time(),
//         ],
//       ),
//     );
//   }
// }


import 'package:do_an/model/fieldModel.dart';
import 'package:do_an/model/questionModel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class ChooseQuestion extends StatefulWidget {
  List<Question> lstQuestion;
  Field ChooseField;
  // int chon;
  ChooseQuestion(
      {Key? key,
      required this.lstQuestion,
      // ignore: non_constant_identifier_names
      required this.ChooseField,
      // required this.chon
      })
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ChooseQuestion> createState() =>
      // ignore: no_logic_in_create_state
      _ChooseQuestionState(lstQuestion: lstQuestion, ChooseField: ChooseField);
}

class _ChooseQuestionState extends State<ChooseQuestion> {
  _ChooseQuestionState({
    required this.lstQuestion,
    // ignore: non_constant_identifier_names
    required this.ChooseField,
  });
  List<Question> lstQuestion;
  // ignore: non_constant_identifier_names
  Field ChooseField;
  String answer = '';
  int round = 0;
  int second = 30;
  bool stop = false;
  int numQuestion = 0;
  Question question = Question(
    idQuestion: '',
    content: '',
    answer: '',
    a: '',
    b: '',
    c: '',
    d: '',
    field: '',
  );
  String name = '';
  String uid = '';
  int point = 0;
  final user = FirebaseAuth.instance.currentUser!;
  void onLoading() {
    setState(() {
      question = lstQuestion[0];
      numQuestion = lstQuestion.length;
    });
    // output();
  }

  void countdown() {
    setState(() {
      if (second > 0) {
        if (!stop) {
          second -= 1;
          Future.delayed(Duration(seconds: 1), countdown);
        }
      } else {
        notification("Bạn đã hết thời gian", "Ok để thoát", false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    onLoading();
    countdown();
    setState(() {
      getUser();
      _namePoint(name);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // void output() {
  //   print(this.widget.chon);
  // }

  Widget _namePoint(String x) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Tên: $x',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            '${round + 1}/$numQuestion',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ],
    );
  }

  CollectionReference roundplay =
      FirebaseFirestore.instance.collection('roundplay');

  Future<void> addRoundPlay(String a, String x, String y, int z) {
    return roundplay
        .doc()
        .set({
          'field': a,
          'uid': x,
          'name': y,
          'point': z,
          'date': DateTime.now(),
        })
        .then((value) => print("ADDED"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Widget _questionText(String x) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          // elevation: 20,
          // shadowColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          backgroundColor: Color.fromARGB(255, 171, 183, 67),
          shape: const StadiumBorder(),
        ),
        child: Text(
          x,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }

  Widget _answer(String x) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            answer = x;
            
          });

          if (question.answer == x && answer == x) {
            if (round < numQuestion - 1) {
              notification("Câu trả lời của bạn đúng", "Ok để tiếp tục", true);
            } else {
              notification("Bạn đã chiến thắng!", "Ok để tiếp tục", false);
            }
          } else {
            notification(
                "Câu trả lời của bạn sai", "Bạn nên dừng lại, hic", false);
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 15,
          shadowColor: Colors.black,
          backgroundColor:
           question.answer == x && answer == x
              ? Colors.green
              : answer == x
                  ? Color.fromARGB(255, 149, 140, 128)
                   : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          shape: const StadiumBorder(),
        ),
        child: Text(
          x,
          style: TextStyle(color: Color(0xFF6CA8F1), fontSize: 18),
        ),
      ),
    );
  }

  Widget _time() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 204, 214, 232),
          border: Border.all(width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Text(
          '$second',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Future notification(String title, String content, bool check) {
    stop = true;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        title: Text(title),
        content: Text(content),
        actions: [
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
                child: const Text("Ok"),
                onPressed: () {
                  setState(() {});
                  Navigator.pop(context);
                  stop = false;
                  if (check) {
                    point += 10;
                    if (round < numQuestion - 1) {
                      answer = '';
                      round += 1;
                      second = 30;

                      question = lstQuestion[round];
                      countdown();
                      // print(ChooseField.name_field.toString());
                      print(point);
                    }
                  } else {
                    addRoundPlay(
                        this.widget.ChooseField.name_field, uid, name, point);
                    Navigator.pop(context);
                  }
                }),
          )
        ],
      ),
    );
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document data: ${documentSnapshot.data()}');
        // print(this.widget.ChooseField.name_field);
        setState(() {
          name = documentSnapshot["name"];
          // print(name);
          uid = documentSnapshot["uid"];
        });
        //    print(uid);
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Image.asset(
            'img/HA2.jpg',
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 25.0,
          ),
          _namePoint(name),
          _questionText(question.content),
          _answer(question.a),
          _answer(question.b),
          _answer(question.c),
          _answer(question.d),
          const SizedBox(
            height: 10.0,
          ),
          _time(),
        ],
      ),
    );
  }
}
