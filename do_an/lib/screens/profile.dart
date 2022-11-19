import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an/main.dart';
import 'package:do_an/screens/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:do_an/screens/home_page.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _pass = true;

  String name = "";
  String imageUrl = "";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  //hide/show password
  @override
  void _showPass() {
    setState(() {
      _pass = !_pass;
    });
  }

  //update
  void updateProfile() {
    final docUser =
        FirebaseFirestore.instance.collection("users").doc(user.uid);
    docUser.update({
      'name': nameController.text.trim(),
      'email': user.email,
      'img': imageUrl
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black26,
      content: Text('You profile has been Changed... Home Again'),
    ));
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //Get data
  Future _getDaTa() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["name"];
          imageUrl = snapshot.data()!["img"];
        });
      }
    });
  }

  @override
  void initState() {
    setState(() {
      super.initState();
      _getDaTa();
    });
  }

  //load img
  void _upImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
      imageQuality: 90,
    );
    print('${image?.path}');
    if (image == null) return;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref =
        FirebaseStorage.instance.ref().child("images").child(uniqueFileName);
    try {
      await ref.putFile(File(image.path));

      ref.getDownloadURL().then((value) async {
        setState(() {
          imageUrl = value;
        });
      });
    } catch (error) {}
  }

  Widget _btnCancel() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent,
        padding: EdgeInsets.symmetric(horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        "CANCEL",
        style: TextStyle(
            fontSize: 14,
            letterSpacing: 2.2,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _btnSave() {
    return ElevatedButton(
      onPressed: () {
        updateProfile();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 50),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        "SAVE",
        style: TextStyle(
            fontSize: 14,
            letterSpacing: 2.2,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _name() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: "NAME",
          labelStyle: TextStyle(
              color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: user.displayName ?? name,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: "EMAIL",
          labelStyle: TextStyle(
              color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: user.email,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomePage()));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  user.displayName ?? name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    imageUrl == ""
                        ? const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            child: CircleAvatar(
                              radius: 58,
                              backgroundImage: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv7KGGABqmk2fkHBntlRDBBt8zjCpAKLVGaQ&usqp=CAU"),
                            ),
                          )
                        : imageUrl.contains('http')
                            ? CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  radius: 58,
                                  backgroundImage: NetworkImage(imageUrl),
                                ),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  radius: 58,
                                  backgroundImage: FileImage(File(imageUrl)),
                                ),
                              ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                          onPressed: _upImage,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _email(),
              _name(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _btnCancel(),
                  _btnSave(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
