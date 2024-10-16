import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/infrastructure/anticorruption_layer/key_value_database.dart';

class CalculationExpressionStore {
  static Future<String> getStoredExpression() async {
    try {
      return await KeyValueDatabase.getStringValue(CALCULATION_EXPRESSION_KEY);
    } catch (e) {
      await KeyValueDatabase.setStringValue(
          CALCULATION_EXPRESSION_KEY, "");

      return "";
    }
  }

  static Future<void> setStoredExpression(String expression) async {
    await KeyValueDatabase.setStringValue(
        CALCULATION_EXPRESSION_KEY, expression);
  }
}
