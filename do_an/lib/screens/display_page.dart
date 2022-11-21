import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an/screens/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:do_an/main.dart';
import 'package:do_an/screens/google_sig_in.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/questionModel.dart';
import 'choose_question.dart';

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  void inState() {
    super.initState();
  }

  List<Question> lstQuestion = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 40.0,
          icon: Icon(Icons.phone_enabled_outlined),
          onPressed: () {},
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        title: IconButton(
          iconSize: 40.0,
          icon: Icon(Icons.change_circle_rounded),
          onPressed: () {},
        ),
        // centerTitle: true,
        actions: <Widget>[
          IconButton(
            iconSize: 40.0,
            icon: Icon(Icons.people_outline_outlined),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 40.0,
            icon: Icon(Icons.back_hand_outlined),
            onPressed: () {},
          ),
        ],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.access_alarms_rounded,
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(  
                height: double.infinity,
                width: double.infinity,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
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
          Container( 
            width: double.infinity,
            height: double.infinity,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              gradient:  const LinearGradient(
               
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 197, 197, 200),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  
              )
            ),
           child: StreamBuilder<QuerySnapshot>(
             stream: FirebaseFirestore.instance.collection("question").snapshots(),
              builder: (context, snapshot)
               { if (snapshot.hasData){ 
                final data = snapshot.data!.docs; 
                for (var row in data)
                 { final r = row.data() as Map<String, dynamic>; 
                 Question data = Question.fromJson(r);
                  lstQuestion.add(data);
                  } return ChooseQuestion(lstQuestion: lstQuestion); } 
                  else if (snapshot.hasError) { 
                    return const Center( child: Text('Có lỗi xảy ra'),
                     ); 
                     } return const CircularProgressIndicator(); 
                     }
                     , ),
                      ),
                      ]
                      
        ),
      );
  }
}
