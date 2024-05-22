import 'package:calculatorapp/calculation_expression_store/calculation_expression_store.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Test Class CalculationExpressionStore", () {
    setUpAll(() {
      Map<String, Object> sharedPreferencesMap = {
        CALCULATION_EXPRESSION_KEY: SIMPLE_EXPRESSION
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);
    });

    test(
        "Test If Method \"getStoreExpression\" Returns Store Calculation Expression",
        () async {
      String storedCalculationExpression =
          await CalculationExpressionStore.getStoredExpression();

      expect(storedCalculationExpression, SIMPLE_EXPRESSION);
    });

    test("Test If Method \"setStoreExpression\" Sets Stored ", () async {
      CalculationExpressionStore.setStoredExpression(SIMPLE_EXPRESSION);

      String storedCalculationExpression =
          await CalculationExpressionStore.getStoredExpression();

      expect(storedCalculationExpression, SIMPLE_EXPRESSION);
    });
  });
}
