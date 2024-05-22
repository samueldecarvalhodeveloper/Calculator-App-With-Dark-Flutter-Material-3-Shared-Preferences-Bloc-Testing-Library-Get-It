import 'package:calculatorapp/infrastructure/exceptions/not_existing_key_exception.dart';
import 'package:calculatorapp/infrastructure/specifications/user_interface_specifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueDatabase {
  static final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  static Future<String> getStringValue(String key) async {
    String? retrievedValue = (await _sharedPreferences).getString(key);

    if (UserInterfaceSpecifications.isRetrievedValueEqualToNull(
        retrievedValue)) {
      throw NotExistingKeyException(key);
    }

    return retrievedValue as String;
  }

  static Future<void> setStringValue(String key, String value) async {
    (await _sharedPreferences).setString(key, value);
  }

  static Future<bool> getBooleanValue(String key) async {
    bool? retrievedValue = (await _sharedPreferences).getBool(key);

    if (UserInterfaceSpecifications.isRetrievedValueEqualToNull(
        retrievedValue)) {
      throw NotExistingKeyException(key);
    }

    return retrievedValue as bool;
  }

  static Future<void> setBooleanValue(String key, bool value) async {
    (await _sharedPreferences).setBool(key, value);
  }
}
