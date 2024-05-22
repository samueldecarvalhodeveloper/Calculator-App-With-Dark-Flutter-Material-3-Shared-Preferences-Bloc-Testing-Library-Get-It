import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:calculatorapp/domains/calculator/infrastructure/specifications/calculator_specifications.dart';

class CalculationExpressionActiveRecordDecorator
    extends CalculationExpressionActiveRecord {
  CalculationExpressionActiveRecordDecorator(
      super._calculationExpressionRegister);

  @override
  void addCharacterToCalculationExpression(CalculatorCharacters character) {
    String currentExpression = super.getCalculationExpression();

    if (CalculatorSpecifications
        .isCalculationExpressionEqualToNotValidExpressionExceptionMessage(
            currentExpression)) {
      super.turnCalculationExpressionEmpty();
    } else {
      super.addCharacterToCalculationExpression(character);
    }
  }

  @override
  void removeLastCharacterFromCalculationExpression() {
    String currentExpression = super.getCalculationExpression();

    if (CalculatorSpecifications
        .isCalculationExpressionEqualToNotValidExpressionExceptionMessage(
            currentExpression)) {
      super.turnCalculationExpressionEmpty();
    } else if (currentExpression.isEmpty) {
      return;
    } else {
      super.removeLastCharacterFromCalculationExpression();
    }
  }

  @override
  void evaluateCalculationExpression() {
    String currentExpression = super.getCalculationExpression();

    if (CalculatorSpecifications
        .isCalculationExpressionEqualToNotValidExpressionExceptionMessage(
            currentExpression)) {
      super.turnCalculationExpressionEmpty();
    } else if (currentExpression.isEmpty) {
      return;
    } else {
      super.evaluateCalculationExpression();
    }
  }
}
