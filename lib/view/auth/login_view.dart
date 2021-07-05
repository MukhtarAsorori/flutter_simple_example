import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/view/auth/register_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_social_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Welcome,", fontSize: 30),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegisterView());
                        },
                        child: CustomText(
                            text: "Sign Up", fontSize: 18, color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  CustomText(
                      text: "Sign in to Continue",
                      fontSize: 14,
                      color: Colors.grey),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    text: 'Email',
                    hint: 'any@email.com',
                    onSaved: (value) {
                      controller.email = value;
                    },
                    validator: (value) {},
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    text: 'Password',
                    hint: '*****',
                    onSaved: (value) {
                      controller.password = value;
                    },
                    validator: (value) {},
                  ),
                  SizedBox(height: 10),
                  CustomText(
                      text: 'Forgot Password?',
                      fontSize: 14,
                      alignment: Alignment.topRight),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'SIGN IN',
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                      //controller.signOut();
                    },
                  ),
                  SizedBox(height: 20),
                  CustomText(text: '-OR-', alignment: Alignment.center),
                  SizedBox(height: 20),
                  CustomSocialButton(
                    text: 'Sign In with Google',
                    imageName: Assets.imagesGoogle48,
                    onPressed: () {
                      controller.signInWithGoogle();
                    },
                  ),
                  SizedBox(height: 10),
                  CustomSocialButton(
                    text: 'Sign In with Facebook',
                    imageName: Assets.imagesFacebook48,
                    onPressed: () {
                      controller.signInWithFacebook();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
