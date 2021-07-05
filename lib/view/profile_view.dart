import 'package:ecommerce_app/core/viewmodel/profile_view_model.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      builder: (controller) => Scaffold(
        body: Container(
          child: Center(
            child: TextButton(
              onPressed: () {
                controller.signOut();
                Get.offAll(LoginView());
              },
              child: Text('Sign Out'),
            ),
          ),
        ),
      ),
    );
  }
}
