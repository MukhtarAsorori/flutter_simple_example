import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        color: Colors.green[400],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: EdgeInsets.all(12),
        onPressed: onPressed,
        child: CustomText(
            text: text, color: Colors.white, alignment: Alignment.center));
  }
}
