import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class \"CalculationExpression\"", () {
    test("Test How Calculation Expression Should be Used On Client", () {
      CalculationExpression calculationExpression =
          CalculationExpression("");

      String initialCalculationExpression =
          calculationExpression.calculationExpression;

      expect(initialCalculationExpression, "");

      calculationExpression.calculationExpression = SIMPLE_EXPRESSION;

      String updateCalculationExpression =
          calculationExpression.calculationExpression;

      expect(updateCalculationExpression, SIMPLE_EXPRESSION);
    });
  });
}
