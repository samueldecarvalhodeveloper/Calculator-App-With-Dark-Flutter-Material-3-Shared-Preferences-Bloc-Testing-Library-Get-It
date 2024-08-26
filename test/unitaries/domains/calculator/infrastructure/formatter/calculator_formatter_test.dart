import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/infrastructure/formatter/calculator_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class \"CalculatorFormatter\"", () {
    test(
        "Test If Method \"getCalculationExpressionWithoutLastCharacter\" Returns Calculation Expression Without Last Character",
        () {
      String calculationExpressionWithoutLastCharacter =
          CalculatorFormatter.getCalculationExpressionWithoutLastCharacter(
              SIMPLE_EXPRESSION);

      expect(calculationExpressionWithoutLastCharacter,
          SIMPLE_EXPRESSION_WITHOUT_LAST_CHARACTER);
    });
  });
}
