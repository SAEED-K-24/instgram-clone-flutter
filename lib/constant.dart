
import 'package:flutter/material.dart';

const primaryColor =  Color.fromRGBO(249, 228, 175, 1);
const secondColor =  Color.fromRGBO(251, 210, 118, 1);
const thirdColor =  Color.fromRGBO(245, 183, 12, 1);
const darkColor =  Color.fromRGBO(201, 101, 23,1);

const bprimaryColor =  Color.fromRGBO(208, 239, 255, 1);
const bsecondColor =  Color.fromRGBO(42, 157, 244, 1);
const bthirdColor =  Color.fromRGBO(24, 123, 205, 1);
const bdarkColor =  Color.fromRGBO(17, 103, 177,1);

Widget textWithStroke(
      {required String text,
      double fontSize: 12,
      double strokeWidth: 1,
      Color textColor: Colors.white,
      Color strokeColor: Colors.black}) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(text, style: TextStyle(fontSize: fontSize, color: textColor)),
      ],
    );
  }
