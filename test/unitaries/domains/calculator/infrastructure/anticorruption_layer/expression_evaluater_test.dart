import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/infrastructure/anticorruption_layer/expression_evaluater.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class \"ExpressionEvaluater\"", () {
    test(
        "Test If Method \"getEvaluatedExpression\" Returns Evaluated Expression",
        () {
      String evaluatedExpression =
          ExpressionEvaluater.getEvaluatedExpression(SIMPLE_EXPRESSION);

      expect(EVALUATED_SIMPLE_EXPRESSION, evaluatedExpression);
    });

    test(
        "Test If Method \"getEvaluatedExpression\" Returns Not Valid Expression Exception If Expression Is Not Valid",
        () {
      String evaluatedExpression =
          ExpressionEvaluater.getEvaluatedExpression(NOT_VALID_EXPRESSION);
      expect(NOT_VALID_EXPRESSION_ERROR_MESSAGE, evaluatedExpression);
    });
  });
}
