import 'package:calculatorapp/constants/domains/calculator_constants.dart';

class CalculatorSpecifications {
  static bool isCalculationExpressionEqualToNotValidExpressionExceptionMessage(
      String calculationExpression) {
    return calculationExpression == NOT_VALID_EXPRESSION_ERROR_MESSAGE;
  }
}
