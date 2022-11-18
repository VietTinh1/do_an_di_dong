import 'package:do_an/screens/login_page.dart';
import 'package:do_an/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:do_an/main.dart';
import 'package:do_an/screens/google_sig_in.dart';
import 'package:provider/provider.dart';
import 'package:do_an/screens/forgot_password_page.dart';
import 'package:email_auth/email_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OTPpage extends StatefulWidget {
  @override
  final String email;
  final String name;
  final String pass;
  final String img;
  final String uid;
  OTPpage({
    required this.email,
    required this.name,
    required this.pass,
    required this.img,
    required this.uid,
  });
  _OTPpage createState() =>
      _OTPpage(email1: email, name1: name, pass1: pass, img1: img, uid1: uid);
}

class _OTPpage extends State<OTPpage> {
  final String email1;
  final String name1;
  final String pass1;
  final String img1;
  final String uid1;
  _OTPpage({
    required this.email1,
    required this.name1,
    required this.pass1,
    required this.img1,
    required this.uid1,
  });
  final TextEditingController txtOTP = TextEditingController();
  final textFieldFocusNode = FocusNode();

  //////////////Hàm để khi load lại sẽ mất email+ mật khẩu
  void dispose() {
    txtOTP.dispose();
    super.dispose();
  }

  void showSnackBar(String x) {
    final snackBar = SnackBar(content: Text(x));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void SendOTP() async {
    EmailAuth.sessionName = "Xac minh";
    var res = await EmailAuth.sendOtp(receiverMail: email1);
    print(email1);
    if (res) {
      showSnackBar('OTP has sent again! Please check your mail');
    } else
      //alter
      print("Khong gui dc OTP");
  }

  @override
  void verifyOTP() async {
    var res = EmailAuth.validate(receiverMail: email1, userOTP: txtOTP.text);
    if (res) {
      signUp();
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text('Verification successful'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text('OK'))
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text('Verification fail'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              ));
    }
  }

  Future signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email1,
      password: pass1,
    )
        //id
        .then((value) {
      FirebaseFirestore.instance.collection("users").doc(value.user!.uid).set({
        "name": name1.trim(),
        "email": email1.trim(),
        "img": "",
        "uid": value.user!.uid,
      });
    });
  }

  Widget _buildOTPTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xFF6CA8F1),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            controller: txtOTP,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5.0, left: 15),
              hintText: 'Enter Your OTP',
              hintStyle: TextStyle(
                color: Colors.white54,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget _buildSendOTPBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          verifyOTP();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Colors.white,
          shape: StadiumBorder(),
        ),
        child: Text(
          "Send Require",
          style: TextStyle(color: Color(0xFF6CA8F1), fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildSendAgainOTPBtn() {
    return GestureDetector(
      // onTap: () => print('Sign Up Button Pressed'),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Text(
              'OTP not received ?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                SendOTP();
              },
              child: Text(
                'Send OTP ',
                style: TextStyle(
                  color: Color.fromARGB(255, 231, 47, 33),
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _obscured = true;
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
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ' Enter OTP',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _buildOTPTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildSendOTPBtn(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildSendAgainOTPBtn(),
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
