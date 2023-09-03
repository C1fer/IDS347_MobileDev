import 'package:flutter/material.dart';
import 'design.dart';

class IconContent extends StatelessWidget {
  IconContent(this.text, this.icon);

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          text,
          style: kmainTextStyle,
        )
      ],
    );
  }
}
