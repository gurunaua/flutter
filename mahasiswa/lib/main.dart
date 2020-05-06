import 'package:flutter/material.dart';
import 'package:mahasiswa/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Color(0xFFFEF9EB)
      ),
      home: LoginScreen(),
    );
  }
}
