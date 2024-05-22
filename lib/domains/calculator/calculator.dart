import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';

class Calculator {
  final CalculationExpressionActiveRecord _calculationExpressionActiveRecord;

  Calculator(this._calculationExpressionActiveRecord);

  String getExpression() {
    return this._calculationExpressionActiveRecord.getCalculationExpression();
  }

  void addCharacter(CalculatorCharacters character) {
    _calculationExpressionActiveRecord
        .addCharacterToCalculationExpression(character);
  }

  void backspace() {
    _calculationExpressionActiveRecord
        .removeLastCharacterFromCalculationExpression();
  }

  void clean() {
    _calculationExpressionActiveRecord.turnCalculationExpressionEmpty();
  }

  void evaluate() {
    _calculationExpressionActiveRecord.evaluateCalculationExpression();
  }
}
