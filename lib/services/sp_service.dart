import 'package:shared_preferences/shared_preferences.dart';

class SpServices {
  static const String userToken = "token";

  //Get Methods
  static getString(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

  Future<int?> getInt(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(key);
  }

  static Future<double?> getDouble(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getDouble(key);
  }

  //SetMethods
  static setString(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static setBool(String key, bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  static setInt(String key, int value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
  }

  static setDouble(String key, double value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setDouble(key, value);
  }

  //Remove Key
  static removeKey(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }
}
