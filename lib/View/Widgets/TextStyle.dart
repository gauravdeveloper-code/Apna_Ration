import 'package:flutter/material.dart';

class MyTextStyle extends StatelessWidget {

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

   const MyTextStyle(
      {
        Key? key,
        required this.text,
        required this.color,
        this.fontSize = 16,
        this.fontWeight = FontWeight.normal,
        this.fontStyle = FontStyle.normal
      }
      ):super(key : key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}