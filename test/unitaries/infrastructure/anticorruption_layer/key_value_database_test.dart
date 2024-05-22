import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/infrastructure/anticorruption_layer/key_value_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Test Class KeyValueDatabase", () {
    setUpAll(() async {
      Map<String, Object> sharedPreferencesValues = {
        CALCULATION_EXPRESSION_KEY: SIMPLE_EXPRESSION,
        THEME_KEY: true
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesValues);
    });

    test(
        "Test If Method \"getStringValue\" Returns Chose Value From Key Value Database",
        () async {
      String retrievedValue =
          await KeyValueDatabase.getStringValue(CALCULATION_EXPRESSION_KEY);

      expect(retrievedValue, SIMPLE_EXPRESSION);
    });

    test(
        "Test If Method \"getStringValue\" Throws Not Existing Key Exception If Chose Key Is Not Set",
        () async {
      try {
        await KeyValueDatabase.getStringValue(NOT_EXISTING_KEY);
      } catch (e) {
        expect(
            e.toString(), NOT_EXISTING_KEY_EXCEPTION_MESSAGE(NOT_EXISTING_KEY));
      }
    });

    test(
        "Test If Method \"getBooleanValue\" Returns Chose Value From Key Value Database",
        () async {
      bool retrievedValue = await KeyValueDatabase.getBooleanValue(THEME_KEY);

      expect(retrievedValue, true);
    });

    test(
        "Test If Method \"getBooleanValue\" Throws Not Existing Key Exception If Chose Key Is Not Set",
        () async {
      try {
        await KeyValueDatabase.getBooleanValue(NOT_EXISTING_KEY);
      } catch (e) {
        expect(
            e.toString(), NOT_EXISTING_KEY_EXCEPTION_MESSAGE(NOT_EXISTING_KEY));
      }
    });
  });
}
