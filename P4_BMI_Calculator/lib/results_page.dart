import 'calculator.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final Calculator calculator;

  ResultsPage({super.key, required this.calculator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(calculator.bmi.toStringAsFixed(2),
                style:
                    TextStyle(color: calculator.resultColor, fontSize: 20.0)),
            SizedBox(
              height: 10,
            ),
            Text(calculator.category,
                style:
                    TextStyle(color: calculator.resultColor, fontSize: 20.0)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                calculator.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
