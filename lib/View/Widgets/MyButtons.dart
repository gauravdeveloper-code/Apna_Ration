import 'package:apna_ration_app/View/Utilities/Constants/Colors.dart';
import 'package:flutter/material.dart';
import 'TextStyle.dart';

class FilledButton extends StatelessWidget{
  final String text;
  final Color color;
  final Color button_color;
  VoidCallback? onpress;

  FilledButton(
      {
        required this.text,
        required this.color,
        required this.button_color,
        this.onpress,
        Key? key
      }
      ): super(key : key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: button_color,
      ),
      child: MyTextStyle(text: text,color: color,fontSize: 16,),
    );
  }
}

class Outlined_Button extends StatelessWidget{
  final String text;
  final Color color;
  final Color button_color;
  VoidCallback? onpress;
  double width;

   Outlined_Button(
      {
        required this.text,
        required this.color,
        required this.button_color,
        this.onpress,
        required this.width,
        Key? key
      }
      ): super(key : key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onpress,
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: color),
            color: button_color,
          ),
        child: Text(text,style: TextStyle(color: primary),),
      ),
    );
  }
}