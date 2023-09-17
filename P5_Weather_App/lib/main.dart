import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'home.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApp',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
