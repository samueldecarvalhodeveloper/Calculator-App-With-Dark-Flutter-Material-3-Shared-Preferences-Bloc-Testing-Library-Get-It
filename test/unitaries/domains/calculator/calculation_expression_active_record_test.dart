import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class CalculationExpressionActiveRecord", () {
    late CalculationExpressionActiveRecord calculationExpressionActiveRecord;
    late CalculationExpressionRegister calculationExpressionRegister;

    setUpAll(() {
      CalculationExpression calculationExpression =
          CalculationExpression("");
      calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
      calculationExpressionActiveRecord =
          CalculationExpressionActiveRecord(calculationExpressionRegister);
    });

    setUp(() {
      calculationExpressionRegister.setCalculationExpression("");
    });

    test(
        "Test If Method \"getCalculationExpression\" Returns Current Calculation Expression",
        () {
      String currentCalculationExpression =
          calculationExpressionActiveRecord.getCalculationExpression();

      expect(currentCalculationExpression, "");
    });

    test(
        "Test If Method \"removeLastCharacterFromCalculationExpression\" Removes Calculation Expression Last Character",
        () {
      calculationExpressionRegister.setCalculationExpression(SIMPLE_EXPRESSION);

      calculationExpressionActiveRecord
          .removeLastCharacterFromCalculationExpression();

      String expressionWithoutLastCharacter =
          calculationExpressionRegister.getCalculationExpression();

      expect(expressionWithoutLastCharacter,
          SIMPLE_EXPRESSION_WITHOUT_LAST_CHARACTER);
    });

    test(
        "Test if Method \"turnCalculationExpressionEmpty\" Removes All Characters From Calculation Expression",
        () {
      calculationExpressionRegister.setCalculationExpression(SIMPLE_EXPRESSION);

      calculationExpressionActiveRecord.turnCalculationExpressionEmpty();

      String currentCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(currentCalculationExpression, "");
    });

    test(
        "Test if Method \"evaluateCalculationExpression\" Evaluates Calculation Expression",
        () {
      calculationExpressionRegister.setCalculationExpression(SIMPLE_EXPRESSION);

      calculationExpressionActiveRecord.evaluateCalculationExpression();

      String evaluatedCalculationExpression =
          calculationExpressionRegister.getCalculationExpression();

      expect(evaluatedCalculationExpression, EVALUATED_SIMPLE_EXPRESSION);
    });
  });
}
