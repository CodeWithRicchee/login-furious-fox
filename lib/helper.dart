import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  //SAVING DATA TO SHARED PREFERENCE
  static Future<bool> saveEmailSharedPreference(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString("EMAIL", email);
  }

  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool("LOGGED", isUserLoggedIn);
  }

  // GETTING DATA FROM SHARED PREFERENCE
  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool("LOGGED");
  }

  static Future<String?> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString("EMAIL");
  }
}
