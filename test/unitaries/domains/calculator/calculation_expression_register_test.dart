import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class \"CalculationExpressionRegister\"", () {
    late CalculationExpression calculationExpression;
    late CalculationExpressionRegister calculationExpressionRegister;

    setUpAll(() {
      calculationExpression = CalculationExpression("");
      calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
    });

    setUp(() {
      calculationExpression.calculationExpression = "";
    });

    test(
        "Test If Method \"getCalculationExpression\" Returns Current Calculation Expression",
        () {
      calculationExpression.calculationExpression = SIMPLE_EXPRESSION;

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, SIMPLE_EXPRESSION);
    });

    test(
        "Test If Method \"setCalculationExpression\" Sets Calculation Expression",
        () {
      calculationExpressionRegister.setCalculationExpression(SIMPLE_EXPRESSION);

      String currentCalculationExpression =
          calculationExpression.calculationExpression;

      expect(currentCalculationExpression, SIMPLE_EXPRESSION);
    });

    test(
        "Test If Method \"addCharacterToCalculationExpression\" Adds Chose Character To Calculation Expression",
        () {
      calculationExpressionRegister
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);

      String currentCalculationExpression =
          calculationExpression.calculationExpression;

      expect(currentCalculationExpression, CalculatorCharacters.ONE.value);
    });
  });
}
