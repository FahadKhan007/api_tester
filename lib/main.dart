import 'package:api_app/colors.dart';
import 'package:api_app/home_screen.dart';
// import 'package:api_app/screens/screen_one.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.myColor,
        primaryColor: Palette.myColor.shade100,
      ),
      home: const HomeScreen(),
    );
  }
}
