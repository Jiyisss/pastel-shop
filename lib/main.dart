import 'package:flutter/material.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pastel Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sans-Serif',
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}