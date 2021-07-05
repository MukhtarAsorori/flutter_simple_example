import 'dart:convert';

import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference extends GetxController {
  Future<UserModel> get getUser async {
    try {
      UserModel model = await _getUser();
      if (model == null) {
        return null;
      }
      return model;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_DATA, json.encode(model.toJson()));
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(USER_DATA);
    return UserModel.fromJson(json.decode(value));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
} // AppSharedPreference
