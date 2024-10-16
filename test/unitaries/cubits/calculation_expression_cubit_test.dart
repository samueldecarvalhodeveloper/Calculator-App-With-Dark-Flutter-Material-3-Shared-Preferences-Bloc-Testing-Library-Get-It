import 'package:calculatorapp/calculation_expression_store/calculation_expression_store.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/cubits/calculation_expression_cubit.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Test Class CalculationExpressionCubit", () {
    late CalculationExpressionCubit calculationExpressionCubit;
    late Calculator calculator;

    setUpAll(() {
      CalculationExpression calculationExpression =
          CalculationExpression("");
      CalculationExpressionRegister calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
      CalculationExpressionActiveRecord calculationExpressionActiveRecord =
          CalculationExpressionActiveRecordDecorator(
              calculationExpressionRegister);

      calculator = Calculator(calculationExpressionActiveRecord);
      calculationExpressionCubit = CalculationExpressionCubit(calculator);
    });

    setUp(() {
      calculator.clean();
    });

    test("Test If Initial State Is Set", () {
      String initialCalculationExpressionState =
          calculationExpressionCubit.state;
      String initialCalculationExpressionFromCalculator =
          calculator.getExpression();

      expect(initialCalculationExpressionState,
          initialCalculationExpressionFromCalculator);
    });

    test(
        "Test If Method \"addCharacter\" Adds Chose Character To Calculation Expression State, On Calculator And Calculation Expression Store",
        () async {
      Map<String, Object> sharedPreferencesMap = {
        CALCULATION_EXPRESSION_KEY: ""
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);

      calculationExpressionCubit.addCharacter(CalculatorCharacters.ONE);

      String currentCalculationExpressionOnCalculator =
          calculator.getExpression();
      String currentCalculationExpressionState =
          calculationExpressionCubit.state;
      String storedCalculationExpression =
          await CalculationExpressionStore.getStoredExpression();

      expect(currentCalculationExpressionOnCalculator,
          CalculatorCharacters.ONE.value);
      expect(currentCalculationExpressionState, CalculatorCharacters.ONE.value);
      expect(storedCalculationExpression, CalculatorCharacters.ONE.value);
    });

    test(
        "Test If Method \"backspace\" Removes Last Character From Calculation Expression State, On Calculator And Calculation Expression Store",
        () async {
      Map<String, Object> sharedPreferencesMap = {
        CALCULATION_EXPRESSION_KEY: SIMPLE_EXPRESSION
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);

      calculator.addCharacter(CalculatorCharacters.ONE);
      calculator.addCharacter(CalculatorCharacters.ADDITION);
      calculator.addCharacter(CalculatorCharacters.ONE);

      calculationExpressionCubit.backspace();

      String currentCalculationExpressionOnCalculator =
          calculator.getExpression();
      String currentCalculationExpressionState =
          calculationExpressionCubit.state;
      String storedCalculationExpression =
          await CalculationExpressionStore.getStoredExpression();

      expect(currentCalculationExpressionOnCalculator,
          SIMPLE_EXPRESSION_WITHOUT_LAST_CHARACTER);
      expect(currentCalculationExpressionState,
          SIMPLE_EXPRESSION_WITHOUT_LAST_CHARACTER);
      expect(storedCalculationExpression,
          SIMPLE_EXPRESSION_WITHOUT_LAST_CHARACTER);
    });

    test(
        "Test If Method \"clean\" Removes All Characters From Calculation Expression State, On Calculator And Calculation Expression Store",
        () async {
      Map<String, Object> sharedPreferencesMap = {
        CALCULATION_EXPRESSION_KEY: SIMPLE_EXPRESSION
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);

      calculator.addCharacter(CalculatorCharacters.ONE);
      calculator.addCharacter(CalculatorCharacters.ADDITION);
      calculator.addCharacter(CalculatorCharacters.ONE);

      calculationExpressionCubit.clean();

      String currentCalculationExpressionOnCalculator =
          calculator.getExpression();
      String currentCalculationExpressionState =
          calculationExpressionCubit.state;
      String storedCalculationExpression =
          await CalculationExpressionStore.getStoredExpression();

      expect(currentCalculationExpressionOnCalculator, "");
      expect(currentCalculationExpressionState, "");
      expect(storedCalculationExpression, "");
    });

    test(
        "Test If Method \"evaluate\" Evaluates Calculation Expression On State, Calculator And Calculation Expression Store",
        () async {
      Map<String, Object> sharedPreferencesMap = {
        CALCULATION_EXPRESSION_KEY: ""
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);

      calculator.addCharacter(CalculatorCharacters.ONE);
      calculator.addCharacter(CalculatorCharacters.ADDITION);
      calculator.addCharacter(CalculatorCharacters.ONE);

      calculationExpressionCubit.evaluate();

      String currentCalculationExpressionOnCalculator =
          calculator.getExpression();
      String currentCalculationExpressionState =
          calculationExpressionCubit.state;
      String storedCalculationExpression =
          await CalculationExpressionStore.getStoredExpression();

      expect(currentCalculationExpressionOnCalculator,
          EVALUATED_SIMPLE_EXPRESSION);
      expect(currentCalculationExpressionState, EVALUATED_SIMPLE_EXPRESSION);
      expect(storedCalculationExpression, EVALUATED_SIMPLE_EXPRESSION);
    });
  });
}
