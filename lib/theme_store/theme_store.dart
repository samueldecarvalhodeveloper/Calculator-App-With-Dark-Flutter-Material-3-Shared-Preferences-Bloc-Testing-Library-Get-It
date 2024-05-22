import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/infrastructure/anticorruption_layer/key_value_database.dart';

class ThemeStore {
  static Future<bool> getStoredThemeState() async {
    try {
      return await KeyValueDatabase.getBooleanValue(THEME_KEY);
    } catch (e) {
      await KeyValueDatabase.setBooleanValue(THEME_KEY, false);

      return false;
    }
  }

  static Future<void> setStoredThemeState(bool state) async {
    await KeyValueDatabase.setBooleanValue(THEME_KEY, state);
  }
}
