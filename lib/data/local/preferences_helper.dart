import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static final PreferencesHelper _instance = PreferencesHelper._internal();
  factory PreferencesHelper() => _instance;
  PreferencesHelper._internal();

  Future<void> saveString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
