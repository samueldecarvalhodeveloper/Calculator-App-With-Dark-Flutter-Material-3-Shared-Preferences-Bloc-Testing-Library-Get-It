import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Calculator Component", () {
    late Calculator calculator;
    late CalculationExpressionActiveRecord calculationExpressionActiveRecord;

    setUpAll(() {
      CalculationExpression calculationExpression =
          CalculationExpression("");
      CalculationExpressionRegister calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
      calculationExpressionActiveRecord =
          CalculationExpressionActiveRecordDecorator(
              calculationExpressionRegister);

      calculator = Calculator(calculationExpressionActiveRecord);
    });

    setUp(() {
      calculationExpressionActiveRecord.turnCalculationExpressionEmpty();
    });

    test("Test If Component Handles Data Input And Outputs Scenario", () {
      String initialCalculationExpression = calculator.getExpression();

      expect(initialCalculationExpression, "");

      calculator.addCharacter(CalculatorCharacters.ONE);
      calculator.addCharacter(CalculatorCharacters.ADDITION);
      calculator.addCharacter(CalculatorCharacters.ONE);

      calculator.backspace();

      calculator.addCharacter(CalculatorCharacters.ONE);

      calculator.evaluate();

      String currentCalculationExpression = calculator.getExpression();

      expect(currentCalculationExpression, EVALUATED_SIMPLE_EXPRESSION);

      calculator.clean();

      String finalCalculationExpression = calculator.getExpression();

      expect(finalCalculationExpression, "");
    });
  });
}
