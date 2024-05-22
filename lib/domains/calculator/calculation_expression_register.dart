import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';

class CalculationExpressionRegister {
  final CalculationExpression _calculationExpression;

  CalculationExpressionRegister(this._calculationExpression);

  String getCalculationExpression() {
    return _calculationExpression.calculationExpression;
  }

  void setCalculationExpression(String newExpression) {
    _calculationExpression.calculationExpression = newExpression;
  }

  void addCharacterToCalculationExpression(
      CalculatorCharacters calculatorCharacters) {
    String currentCalculationExpression =
        _calculationExpression.calculationExpression;
    String calculationResultWithNewCharacter =
        currentCalculationExpression + calculatorCharacters.value;

    _calculationExpression.calculationExpression =
        calculationResultWithNewCharacter;
  }
}
