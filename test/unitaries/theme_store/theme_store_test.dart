import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/theme_store/theme_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Test Class ThemeStore", () {
    setUpAll(() {
      Map<String, Object> sharedPreferencesValues = {THEME_KEY: true};

      SharedPreferences.setMockInitialValues(sharedPreferencesValues);
    });

    test("Test If Method \"getStoredThemeState\" Return Stored Theme State",
        () async {
      bool storedThemeState = await ThemeStore.getStoredThemeState();

      expect(storedThemeState, true);
    });

    test("Test If method \"setStoredThemeState\" Sets Store Theme State",
        () async {
      await ThemeStore.setStoredThemeState(true);

      bool storedThemeState = await ThemeStore.getStoredThemeState();

      expect(storedThemeState, true);
    });
  });
}
