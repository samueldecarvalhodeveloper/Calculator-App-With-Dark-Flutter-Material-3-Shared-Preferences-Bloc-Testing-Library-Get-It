import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Component Calculator", () {
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

    test(
        "Test If Calculation Expression Is Get",
        () {
      String currentCalculationExpressionFromCalculationExpressionActiveRecord =
          calculator.getExpression();
      String currentCalculationExpressionFromCalculator =
          calculator.getExpression();

      expect(currentCalculationExpressionFromCalculator,
          currentCalculationExpressionFromCalculationExpressionActiveRecord);
    });

    test(
        "Test Character Is Added To Calculation Expression",
        () {
      calculator.addCharacter(CalculatorCharacters.ONE);

      String currentCalculationExpression =
          calculationExpressionActiveRecord.getCalculationExpression();

      expect(currentCalculationExpression, CalculatorCharacters.ONE.value);
    });

    test(
        "Test If Calculation Expression Last Character Is Removed",
        () {
      calculationExpressionActiveRecord
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);
      calculationExpressionActiveRecord
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);

      calculator.backspace();

      String currentCalculationExpression =
          calculationExpressionActiveRecord.getCalculationExpression();

      expect(currentCalculationExpression, CalculatorCharacters.ONE.value);
    });

    test(
        "Test If Calculation Expression Is Cleaned",
        () {
      calculationExpressionActiveRecord
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);
      calculationExpressionActiveRecord
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);

      calculator.clean();

      String currentCalculationExpression =
          calculationExpressionActiveRecord.getCalculationExpression();

      expect(currentCalculationExpression, "");
    });

    test("Test If Calculation Expression is Evaluated", () {
      calculationExpressionActiveRecord
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);
      calculationExpressionActiveRecord
          .addCharacterToCalculationExpression(CalculatorCharacters.ADDITION);
      calculationExpressionActiveRecord
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);

      calculator.evaluate();

      String currentCalculationExpression =
          calculationExpressionActiveRecord.getCalculationExpression();

      expect(currentCalculationExpression, EVALUATED_SIMPLE_EXPRESSION);
    });
  });
}
