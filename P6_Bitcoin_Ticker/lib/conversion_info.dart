import 'package:flutter/material.dart';

class ConversionInfo extends StatefulWidget {
  ConversionInfo(
      {super.key,
      required this.coin,
      required this.currency,
      required this.conversion});

  String currency = "";
  String coin = "";
  String conversion = "";

  @override
  State<ConversionInfo> createState() => _ConversionInfoState();
}

class _ConversionInfoState extends State<ConversionInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      height: 50,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(0xff41c4ff),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xffDDDDDD),
              blurRadius: 8.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 0.0),
            )
          ]),
      child: Text('1 ${widget.coin} = ${widget.conversion} ${widget.currency}'),
    );
  }
}
