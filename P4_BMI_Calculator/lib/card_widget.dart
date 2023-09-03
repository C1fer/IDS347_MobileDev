import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
      {super.key,
        required this.bgColor,
        required this.content,
        required this.tapAction});

  Color bgColor;
  Widget content;
  void Function() tapAction;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.bgColor,
        ),
        child: widget.content,
      ),
      onTap: widget.tapAction,
    );
  }
}
