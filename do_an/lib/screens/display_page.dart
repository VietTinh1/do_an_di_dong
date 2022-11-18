import 'package:do_an/screens/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:do_an/main.dart';
import 'package:do_an/screens/google_sig_in.dart';
import 'package:provider/provider.dart';

class DisplayPage extends StatefulWidget {
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  //hide/show password

  Widget _namePoint() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Tên: Nguyễn Hồ Minh Tài',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Điểm: 10',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _questionText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          // elevation: 20,
          // shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Color.fromARGB(255, 171, 183, 67),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Con mèo có mấy chân",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionA() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 15,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Colors.white,
          shape: StadiumBorder(),
        ),
        child: Text(
          "Câu A: 2 chân ",
          style: TextStyle(color: Color(0xFF6CA8F1), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionB() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 15,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Colors.white,
          shape: StadiumBorder(),
        ),
        child: Text(
          "Câu B: 1 chân ",
          style: TextStyle(color: Color(0xFF6CA8F1), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionC() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 15,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Colors.white,
          shape: StadiumBorder(),
        ),
        child: Text(
          "Câu C: 3 chân ",
          style: TextStyle(color: Color(0xFF6CA8F1), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionD() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 15,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Colors.white,
          shape: StadiumBorder(),
        ),
        child: Text(
          "Câu D: 4 chân ",
          style: TextStyle(color: Color(0xFF6CA8F1), fontSize: 18),
        ),
      ),
    );
  }

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
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.access_alarms_rounded,
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
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
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 35.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'img/HA2.jpg',
                        width: 150,
                        height: 150,
                      ),
                      // Text(
                      //   'Triệu Phú Mobile',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 30.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 20.0),
                      SizedBox(
                        height: 25.0,
                      ),
                      _namePoint(),
                      _questionText(),
                      _questionA(),
                      _questionB(),
                      _questionC(),
                      _questionD(),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
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
