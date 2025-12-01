import 'package:flutter/material.dart';
import 'package:gym_note/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Note',
      theme: ThemeData(
        primaryColor: Colors.teal[600],
      ),
      home: HomeScreen(),
    );
  }
}
