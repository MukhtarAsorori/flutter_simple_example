import 'package:ecommerce_app/core/helper/app_shared_pref.dart';
import 'package:ecommerce_app/core/viewmodel/auth_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/cart_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/control_view_model.dart';
import 'package:ecommerce_app/core/viewmodel/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => AppSharedPreference());
  }
}
