import 'package:calculatorapp/calculation_expression_store/calculation_expression_store.dart';
import 'package:calculatorapp/constants/string_utilities_constants.dart';

class CalculationExpressionStoreMock extends CalculationExpressionStore {
  static String _expression = EMPTY_STRING;

  static Future<void> mockInitialExpression(String expression) async {
    _expression = expression;
  }

  static Future<String> getStoredExpression() async {
    return _expression;
  }

  static Future<void> setStoredExpression(String expression) async {
    _expression = expression;
  }
}
