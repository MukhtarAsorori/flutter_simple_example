import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/control_view_model.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentView,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Explore'),
              ),
              label: '',
              icon: Image.asset(Assets.imagesLocation,
                  fit: BoxFit.contain, width: 20)),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Cart'),
              ),
              label: '',
              icon: Image.asset(Assets.imagesBasket,
                  fit: BoxFit.contain, width: 20)),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Account'),
              ),
              label: '',
              icon: Image.asset(Assets.imagesUser,
                  fit: BoxFit.contain, width: 20)),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
