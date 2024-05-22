import 'package:calculatorapp/theme_store/theme_store.dart';

class ThemeStoreMock extends ThemeStore {
  static bool _themeState = false;

  static Future<void> mockInitialThemeState(bool state) async {
    _themeState = state;
  }

  static Future<bool> getStoredThemeState() async {
    return _themeState;
  }

  static Future<void> setStoredThemeState(bool state) async {
    _themeState = state;
  }
}
