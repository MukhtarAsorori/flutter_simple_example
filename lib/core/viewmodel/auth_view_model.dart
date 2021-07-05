import 'package:ecommerce_app/core/helper/app_shared_pref.dart';
import 'package:ecommerce_app/core/services/firestore_user.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();
  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;

  String email, password, name;

  final AppSharedPreference _preference = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit ex: fetch data from firebase | db | cloud
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady, when its showing on screen
    super.onReady();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    // TODO: implement onClose, when controller is deleted from memory
    super.onClose();
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _auth
        .signInWithCredential(credential)
        .then((credential) => saveUser(credential));
    Get.offAll(ControlView());
  }

  void signInWithFacebook() async {
    /*FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(accessToken);
      await _auth
          .signInWithCredential(credential)
          .then((credential) => saveUser(credential));
    }*/
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser()
            .getCurrentUser(value.user.uid)
            .then((value) => setUser(UserModel.fromJson(value.data())));
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e.message);
      Get.snackbar('Error Login Account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((credential) async {
        saveUser(credential);
      });
    } catch (e) {
      print(e.message);
      Get.snackbar('Error Login Account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential credential) async {
    UserModel model = UserModel(
      userId: credential.user.uid,
      email: credential.user.email,
      name: name == null ? credential.user.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(model);
    setUser(model);

    Get.offAll(ControlView());
  }

  void signOut() async {
    await _googleSignIn.signOut();
    // await _facebookLogin.logOut();
  }

  void setUser(UserModel model) async {
    await _preference.setUser(model);
  }
}
