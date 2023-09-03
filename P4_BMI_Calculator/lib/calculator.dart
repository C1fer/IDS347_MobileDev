import 'dart:math';

import 'package:flutter/material.dart';



class Calculator {
  final height;
  final weight;

  double bmi = 0;
  String message = '';
  String category = '';
  Color? resultColor;

  Calculator(this.height, this.weight);

  void calculateBMI() {
    bmi = weight / pow(height / 100, 2.0);
    switch (bmi) {
      case < 18.5:
        category = 'Underweight';
        message =
            'Focus on a balanced and nutritious diet to support weight gain, including an appropriate mix of protein, healthy fats, carbohydrates, and vitamins/minerals.';
        resultColor = Colors.blue;
        break;
      case < 25:
        category = 'Normal';
        message =
            'Maintain a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats.';
        resultColor = Colors.green;
        break;
      case < 30:
        category = 'Overweight';
        message =
            'Emphasize portion control and choose whole, unprocessed foods.';
        resultColor = Colors.yellow;
        break;
      case < 35:
        category = 'Obesity I';
        message =
        'Increase physical activity to promote weight loss, aiming for at least 150 minutes of moderate-intensity aerobic activity per week.';
        resultColor = Colors.orange;
        break;
      default:
        category = 'Obesity II';
        message =
            'Consult with healthcare professionals to explore medical or surgical interventions, along with comprehensive lifestyle changes.';
        resultColor = Colors.red;
        break;
    }
  }
}
