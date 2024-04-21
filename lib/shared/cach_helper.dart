import 'package:shared_preferences/shared_preferences.dart';

class cachHelper {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
    } catch (e) {
      print('Failed to initialize SharedPreferences: $e');
      // Handle initialization failure
    }
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value is String) {
        return await sharedPreferences!.setString(key, value);
      } else if (value is int) {
        return await sharedPreferences!.setInt(key, value);
      } else if (value is bool) {
        return await sharedPreferences!.setBool(key, value);
      } else {
        // Unsupported data type
        return false;
      }
    } catch (e) {
      print('Failed to save data to SharedPreferences: $e');
      return false;
    }
  }

  static dynamic getData({required String key}) {
    try {
      return sharedPreferences!.get(key);
    } catch (e) {
      print('Failed to get data from SharedPreferences: $e');
      return null; // Handle error case
    }
  }

  static Future<bool> removeData(String key) async {
    try {
      return await sharedPreferences!.remove(key);
    } catch (e) {
      print('Failed to remove data from SharedPreferences: $e');
      return false; // Handle error case
    }
  }
}
