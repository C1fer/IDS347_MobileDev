import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black54,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black54,
            centerTitle: true,
          )),
      title: 'BMI Calculator',
      home: Home(),
    );
  }
}
