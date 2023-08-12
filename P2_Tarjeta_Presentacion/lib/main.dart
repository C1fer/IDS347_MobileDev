import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF606c88),
                Color(0xFF3f4c6b),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFF3f4c6b),
                backgroundImage: AssetImage('images/person.png'),
                radius: 50,
              ),
              Text(
                'Rusbel Duarte',
                style: TextStyle(
                  fontFamily: 'Caprasimo',
                  fontSize: 40.0,
                  color: Colors.white60,
                ),
              ),
              Text(
                'Estudiante Ing. de Software',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 200.0,
                child: Divider(
                  thickness: 3.0,
                  color: Colors.white,
                ),
              ),
              buildCard("+1 829-906-8751", Icons.phone, Colors.deepOrangeAccent),
              buildCard("1103307@est.intec.edu.do", Icons.email, Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(text, icon, color) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: ListTile(
        title: Text(text),
        leading: Icon(icon, color: color),
      ),
    );
  }
}
