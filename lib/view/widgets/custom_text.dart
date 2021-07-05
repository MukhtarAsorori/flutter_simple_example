import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final double height;
  final Alignment alignment;

  const CustomText({
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.height = 1,
    this.alignment = Alignment.topLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        child: Text(text,
            style:
                TextStyle(color: color, height: height, fontSize: fontSize)));
  }
}
