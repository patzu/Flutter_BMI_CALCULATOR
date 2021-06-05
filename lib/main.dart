import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:i_am_rich/screens/landing_page.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color.fromRGBO(17, 22, 57, 1),
        accentColor: Colors.white,
        scaffoldBackgroundColor: Color.fromRGBO(15, 20, 55, 1),
      ),
      home: LandingPage(),
    );
  }
}
