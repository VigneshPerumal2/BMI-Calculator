import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'results.dart';
void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        accentColor: Color(0xFFEA1556),
        scaffoldBackgroundColor: Color(0xFF090C22),
      ),
     initialRoute: '/',
      routes: {
        '/':(context)=>MyHomePage(),
        '/results':(context)=>Results()
      },
    );
  }
}
