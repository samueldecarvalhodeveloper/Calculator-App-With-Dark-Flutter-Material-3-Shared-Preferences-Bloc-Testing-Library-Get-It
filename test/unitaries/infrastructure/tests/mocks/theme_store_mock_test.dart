import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/infrastructure/tests/mocks/theme_store_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class ThemeStoreMock", () {
    test("Test Class Delivers A Testing Mock Substitution For ThemeStore",
        () async {
      await ThemeStoreMock.setStoredThemeState(THEME_INITIAL_STATE);

      bool initialThemeState = await ThemeStoreMock.getStoredThemeState();

      expect(initialThemeState, THEME_INITIAL_STATE);

      ThemeStoreMock.setStoredThemeState(true);

      bool updatedThemeState = await ThemeStoreMock.getStoredThemeState();

      expect(updatedThemeState, true);
    });
  });
}
