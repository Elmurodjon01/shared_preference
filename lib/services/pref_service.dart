import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';

class Prefs {

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //turning user object to string and its usage
  static void storeUser(User user) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    _prefs.setString("user", stringUser);
  }

   Future<User?> loadUser() async {
    final SharedPreferences prefs = await _prefs;
    //SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString('user');
    if (stringUser == null || stringUser.isEmpty){
      return null;
    }
    dynamic map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.remove('user');
  }
}

























//
//
// static void storeName(String name) async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.setString("name", name);
// }
//
// static Future<String?> loadName() async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// return prefs.getString('name');
// }
//
// static Future<bool> removeName() async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
// return prefs.remove('name');
// }
//
//
//
//
