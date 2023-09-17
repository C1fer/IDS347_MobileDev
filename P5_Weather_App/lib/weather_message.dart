import 'package:flutter/material.dart';
import 'design.dart';

Widget WeatherMessage(temperature) {
  var message;
  switch (temperature) {
    case < 15:
      message = "Bundle up, it's cold outside! ❄️🧥";
    case < 21:
      message = "Enjoy the mild weather! 🌤️";
    case < 30:
      message = "A perfect day for outdoor activities! ☀️🏞️";
    default:
      message = "Stay cool and hydrated in this heat! 🌡️🥤";
  }
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Text(
      message,
      style: kMessageTextStyle,
      textAlign: TextAlign.center,
    ),
  );
}
