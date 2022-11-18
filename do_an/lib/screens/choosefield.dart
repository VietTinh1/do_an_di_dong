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
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _questionToan() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DisplayPage()));
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Color.fromARGB(232, 171, 183, 67),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Môn Toán",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionVan() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DisplayPage()));
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Color.fromARGB(223, 123, 154, 0),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Môn Văn",
          style: TextStyle(color: Color.fromARGB(247, 15, 0, 0), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionAnh() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DisplayPage()));
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Color.fromARGB(179, 179, 210, 4),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Anh Văn",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionLy() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DisplayPage()));
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Color.fromARGB(229, 158, 89, 5),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Môn Lý",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionHoa() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DisplayPage()));
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Color.fromARGB(213, 139, 61, 28),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Môn Hóa",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        ),
      ),
    );
  }

  Widget _questionLichSu() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DisplayPage()));
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          shadowColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Color.fromARGB(244, 226, 128, 41),
          shape: StadiumBorder(),
        ),
        child: Text(
          "Môn Lịch Sử",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
        ),
      ),
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
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset('img/HA2.jpg',width: 150, height: 150,),
                      Text(
                        'Chọn Lĩnh Vực',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 20.0),
                      SizedBox(
                        height: 30.0,
                      ),
                      _namePoint(),
                      _questionToan(),
                      _questionVan(),
                      _questionAnh(),
                      _questionLy(),
                      _questionHoa(),
                      _questionLichSu()
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
