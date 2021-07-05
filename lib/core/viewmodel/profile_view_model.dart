import 'package:ecommerce_app/core/helper/app_shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final AppSharedPreference _preference = Get.find();

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    _preference.deleteUser();
  }
}
