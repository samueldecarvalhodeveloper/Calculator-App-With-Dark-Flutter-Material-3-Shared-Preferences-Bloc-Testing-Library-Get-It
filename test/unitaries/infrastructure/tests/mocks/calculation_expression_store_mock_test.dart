import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/infrastructure/tests/mocks/calculation_expression_store_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class CalculationExpressionStoreMock", () {
    test(
        "Test Class Delivers A Testing Mock Substitution For CalculationExpressionStoreMock",
        () async {
      await CalculationExpressionStoreMock.mockInitialExpression(
          SIMPLE_EXPRESSION);

      String initialExpression =
          await CalculationExpressionStoreMock.getStoredExpression();

      expect(initialExpression, SIMPLE_EXPRESSION);

      await CalculationExpressionStoreMock.setStoredExpression("");

      String updatedExpression =
          await CalculationExpressionStoreMock.getStoredExpression();

      expect(updatedExpression, "");
    });
  });
}
