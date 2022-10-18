import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.add, size: 32),
                label: Text('Đăng xuất'),
                onPressed: () => FirebaseAuth.instance.signOut(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(user.email!),
            )
          ],
        ),
      ),
    );
  }
}
