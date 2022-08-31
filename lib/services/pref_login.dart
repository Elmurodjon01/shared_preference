import 'dart:convert';

import 'package:shared_preference/model/loginUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static storeLoginUser(LoginUserModel loginUserModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(loginUserModel);
    prefs.setString('loginUserModel', stringUser);
  }

  static Future<LoginUserModel?> loadLoginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString("loginUserModel");
    if (stringUser == null || stringUser.isEmpty) null;

    dynamic map = jsonDecode(stringUser!);
    return LoginUserModel.fromJson(map);
  }

  static Future<bool> removeLoginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("loginUserModel");
  }
}
