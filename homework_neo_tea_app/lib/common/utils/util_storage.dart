import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil _instance = StorageUtil._();

  factory StorageUtil() => _instance;
  static SharedPreferences? _sharedPreferences;

  StorageUtil._();

  static Future<void> init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJson(String key, dynamic json) {
    String jsonString = jsonEncode(json);
    return _sharedPreferences!.setString(key, jsonString);
  }

  dynamic getJson(String key) {
    String? jsonString = _sharedPreferences!.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool value) {
    return _sharedPreferences!.setBool(key, value);
  }

  bool getBool(String key) {
    bool? result = _sharedPreferences!.getBool(key);
    return result == null ? false : result;
  }

  Future<bool> remove(String key) {
    return _sharedPreferences!.remove(key);
  }
}
