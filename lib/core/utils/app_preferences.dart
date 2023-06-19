import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const userId = "userId";
  static const userName = "userName";
  static const cookies = "cookies";

  setUserId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userId, value);
  }

  removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(userId);
    prefs.remove(userName);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId);
  }

  setUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userName, value);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName);
  }

  setCookies(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(cookies, value);
  }

  Future<String?> getCookies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(cookies);
  }
}
