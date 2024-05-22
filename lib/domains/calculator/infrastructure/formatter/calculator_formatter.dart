import 'package:calculatorapp/constants/string_utilities_constants.dart';

class CalculatorFormatter {
  static String getCalculationExpressionWithoutLastCharacter(
      String calculationExpression) {
    return calculationExpression.substring(
        STRING_FIRST_INDEX, STRING_LAST_INDEX(calculationExpression));
  }
}
