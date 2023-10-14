import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(CoinApp());

class CoinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final them = ThemeData.dark();
    return MaterialApp(
      theme: them.copyWith(
          primaryColor: Colors.white
      ),
      title: 'Material App',
      home: Home(),
    );
  }
}
