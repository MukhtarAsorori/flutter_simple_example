import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPressed;

  const CustomSocialButton({this.text, this.imageName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: FlatButton(
          onPressed: onPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Image.asset(imageName, width: 24, height: 24),
              SizedBox(width: 80),
              CustomText(
                text: text,
              )
            ],
          )),
    );
  }
}
