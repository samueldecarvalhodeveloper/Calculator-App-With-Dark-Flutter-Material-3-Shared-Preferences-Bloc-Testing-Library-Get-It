import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/string_utilities_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class \"CalculationExpressionActiveRecordDecorator\"", () {
    late CalculationExpressionRegister calculationExpressionRegister;
    late CalculationExpressionActiveRecordDecorator
        calculationExpressionActiveRecordDecorator;

    setUpAll(() {
      CalculationExpression calculationExpression =
          CalculationExpression(EMPTY_STRING);
      calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
      calculationExpressionActiveRecordDecorator =
          CalculationExpressionActiveRecordDecorator(
              calculationExpressionRegister);
    });

    test(
        "Test If Method \"addCharacterToCalculationExpression\" Turns Expression Empty If Expression Is Equal To Not Valid Expression Exception Message",
        () {
      calculationExpressionRegister
          .setCalculationExpression(NOT_VALID_EXPRESSION_ERROR_MESSAGE);

      calculationExpressionActiveRecordDecorator
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, EMPTY_STRING);
    });

    test(
        "Test If Method \"addCharacterToCalculationExpression\" Add Chose Character",
        () {
      calculationExpressionRegister.setCalculationExpression(EMPTY_STRING);

      calculationExpressionActiveRecordDecorator
          .addCharacterToCalculationExpression(CalculatorCharacters.ONE);

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, CalculatorCharacters.ONE.value);
    });

    test(
        "Test If Method \"removeLastCharacterFromCalculationExpression\" Turns Expression Empty If It Is Equal To Not Valid Expression Exception Message",
        () {
      calculationExpressionRegister
          .setCalculationExpression(NOT_VALID_EXPRESSION_ERROR_MESSAGE);

      calculationExpressionActiveRecordDecorator
          .removeLastCharacterFromCalculationExpression();

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, EMPTY_STRING);
    });

    test(
        "Test If Method \"removeLastCharacterFromCalculationExpression\" Keeps Expression Empty If It Is Empty",
        () {
      calculationExpressionRegister.setCalculationExpression(EMPTY_STRING);

      calculationExpressionActiveRecordDecorator
          .removeLastCharacterFromCalculationExpression();

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, EMPTY_STRING);
    });

    test(
        "Test If Method \"removeLastCharacterFromCalculationExpression\" Removes Last Character From Expression",
        () {
      calculationExpressionRegister.setCalculationExpression(SIMPLE_EXPRESSION);

      calculationExpressionActiveRecordDecorator
          .removeLastCharacterFromCalculationExpression();

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression,
          SIMPLE_EXPRESSION_WITHOUT_LAST_CHARACTER);
    });

    test(
        "Test If Method \"evaluateCalculationResultExpression\" Turns Expression Empty If It Is Equal To Not Valid Expression Exception Message",
        () {
      calculationExpressionRegister
          .setCalculationExpression(NOT_VALID_EXPRESSION_ERROR_MESSAGE);

      calculationExpressionActiveRecordDecorator
          .evaluateCalculationExpression();

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, EMPTY_STRING);
    });

    test(
        "Test If Method \"evaluateCalculationResultExpression\" Keeps Expression Empty If Expression Is Already Empty",
        () {
      calculationExpressionRegister.setCalculationExpression(EMPTY_STRING);

      calculationExpressionActiveRecordDecorator
          .evaluateCalculationExpression();

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, EMPTY_STRING);
    });

    test(
        "Test If Method \"evaluateCalculationResultExpression\" Evaluates Expression",
        () {
      calculationExpressionRegister.setCalculationExpression(SIMPLE_EXPRESSION);

      calculationExpressionActiveRecordDecorator
          .evaluateCalculationExpression();

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, EVALUATED_SIMPLE_EXPRESSION);
    });
  });
}
