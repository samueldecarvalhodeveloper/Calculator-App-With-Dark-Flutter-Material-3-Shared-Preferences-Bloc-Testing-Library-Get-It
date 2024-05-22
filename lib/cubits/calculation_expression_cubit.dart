import 'package:calculatorapp/calculation_expression_store/calculation_expression_store.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculationExpressionCubit extends Cubit<String> {
  final Calculator _calculator;

  CalculationExpressionCubit(this._calculator)
      : super(_calculator.getExpression());

  void addCharacter(CalculatorCharacters character) {
    _calculator.addCharacter(character);

    String currentExpression = _calculator.getExpression();

    CalculationExpressionStore.setStoredExpression(currentExpression);

    emit(currentExpression);
  }

  void backspace() {
    _calculator.backspace();

    String currentExpression = _calculator.getExpression();

    CalculationExpressionStore.setStoredExpression(currentExpression);

    emit(currentExpression);
  }

  void clean() {
    _calculator.clean();

    String currentExpression = _calculator.getExpression();

    CalculationExpressionStore.setStoredExpression(currentExpression);

    emit(currentExpression);
  }

  void evaluate() {
    _calculator.evaluate();

    String currentExpression = _calculator.getExpression();

    CalculationExpressionStore.setStoredExpression(currentExpression);

    emit(currentExpression);
  }
}
