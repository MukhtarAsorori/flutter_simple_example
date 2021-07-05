import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Get.off(LoginView());
              },
              child: Icon(Icons.arrow_back, color: Colors.black)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomText(text: "Sign Up", fontSize: 30),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    text: 'Full Name',
                    hint: 'your name',
                    onSaved: (value) {
                      controller.name = value;
                    },
                    validator: (value) {},
                  ),
                  SizedBox(height: 16),
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
                  CustomButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.createUserWithEmailAndPassword();
                      }
                      //controller.signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
