import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/infrastructure/specifications/calculator_specifications.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class \"CalculatorSpecifications\"", () {
    test(
        "Test If Method \"isCalculationExpressionEqualToNotValidExpressionExceptionMessage\" Returns True If Expression Is Equal To Not Valid Expression Exception Message",
        () {
      bool expressionIsNotValidExpressionExceptionMessage =
          CalculatorSpecifications
              .isCalculationExpressionEqualToNotValidExpressionExceptionMessage(
                  NOT_VALID_EXPRESSION_ERROR_MESSAGE);
      bool expressionIsNotNotValidExpressionExceptionMessage =
          CalculatorSpecifications
              .isCalculationExpressionEqualToNotValidExpressionExceptionMessage(
                  SIMPLE_EXPRESSION);

      expect(expressionIsNotValidExpressionExceptionMessage, true);
      expect(expressionIsNotNotValidExpressionExceptionMessage, false);
    });
  });
}
