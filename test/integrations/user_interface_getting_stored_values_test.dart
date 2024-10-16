import 'package:calculatorapp/application/application.dart';
import 'package:calculatorapp/calculation_expression_store/calculation_expression_store.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/user_interface_calculator_characters/user_interface_calculator_characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Test Integration Between User Interface And Calculator Domain", () {
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
    });

    testWidgets(
        "Test If User Interface Stores Last Session Calculation Expression",
        (WidgetTester tester) async {
      Map<String, Object> sharedPreferencesMap = {
        CALCULATION_EXPRESSION_KEY: SIMPLE_EXPRESSION
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);

      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Finder buttonOneElement =
          find.text(UserInterfaceCalculatorCharacters.ONE.value);
      Finder buttonAdditionElement =
          find.text(UserInterfaceCalculatorCharacters.ADDITION.value);

      await tester.tap(buttonOneElement);
      await tester.tap(buttonAdditionElement);
      await tester.tap(buttonOneElement);

      String storedExpression =
          await CalculationExpressionStore.getStoredExpression();

      expect(storedExpression, SIMPLE_EXPRESSION);
    });
  });
}
