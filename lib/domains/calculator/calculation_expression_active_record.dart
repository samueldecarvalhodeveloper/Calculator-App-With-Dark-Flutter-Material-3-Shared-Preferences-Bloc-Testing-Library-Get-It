import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:calculatorapp/domains/calculator/infrastructure/anticorruption_layer/expression_evaluater.dart';
import 'package:calculatorapp/domains/calculator/infrastructure/formatter/calculator_formatter.dart';

class CalculationExpressionActiveRecord {
  CalculationExpressionRegister _calculationExpressionRegister;

  CalculationExpressionActiveRecord(this._calculationExpressionRegister);

  String getCalculationExpression() {
    return _calculationExpressionRegister.getCalculationExpression();
  }

  void addCharacterToCalculationExpression(CalculatorCharacters character) {
    _calculationExpressionRegister
        .addCharacterToCalculationExpression(character);
  }

  void removeLastCharacterFromCalculationExpression() {
    String currentCalculationExpression =
        _calculationExpressionRegister.getCalculationExpression();
    String currentCalculationExpressionWithoutLastCharacter =
        CalculatorFormatter.getCalculationExpressionWithoutLastCharacter(
            currentCalculationExpression);

    _calculationExpressionRegister.setCalculationExpression(
        currentCalculationExpressionWithoutLastCharacter);
  }

  void turnCalculationExpressionEmpty() {
    _calculationExpressionRegister.setCalculationExpression("");
  }

  void evaluateCalculationExpression() {
    String currentCalculationExpression =
        _calculationExpressionRegister.getCalculationExpression();
    String evaluatedCalculationExpression =
        ExpressionEvaluater.getEvaluatedExpression(
            currentCalculationExpression);

    _calculationExpressionRegister
        .setCalculationExpression(evaluatedCalculationExpression);
  }
}
