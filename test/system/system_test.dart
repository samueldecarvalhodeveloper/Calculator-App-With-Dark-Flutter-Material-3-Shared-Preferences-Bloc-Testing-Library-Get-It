import 'package:calculatorapp/application/application.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/infrastructure/tests/mocks/calculation_expression_store_mock.dart';
import 'package:calculatorapp/infrastructure/tests/mocks/theme_store_mock.dart';
import 'package:calculatorapp/user_interface_calculator_characters/user_interface_calculator_characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("System Testing", () {
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

    testWidgets("Test If Calculation Is Executed On User Interface",
        (WidgetTester tester) async {
      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Finder buttonOneElement =
          find.text(UserInterfaceCalculatorCharacters.ONE.value);
      Finder buttonAdditionElement =
          find.text(UserInterfaceCalculatorCharacters.ADDITION.value);
      Finder buttonBackspaceElement =
          find.text(UserInterfaceCalculatorCharacters.BACKSPACE.value);
      Finder buttonEvaluateElement =
          find.text(UserInterfaceCalculatorCharacters.EVALUATE.value);
      Finder buttonCleanElement =
          find.text(UserInterfaceCalculatorCharacters.CLEAN.value);

      await tester.tap(buttonOneElement);
      await tester.tap(buttonAdditionElement);
      await tester.tap(buttonOneElement);

      await tester.tap(buttonBackspaceElement);

      await tester.tap(buttonOneElement);

      await tester.tap(buttonEvaluateElement);

      await tester.tap(buttonCleanElement);

      await tester.pump();

      Finder viewfinderElement = find.text("");

      expect(viewfinderElement, findsOneWidget);
    });
    testWidgets("Test If Toggle Theme Is Executed On User Interface",
        (WidgetTester tester) async {
      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Key toggleThemeActionButtonKey =
          Key(TOGGLE_THEME_ACTION_BUTTON_KEY_VALUE);
      Key toggleThemeActionButtonDarkModeIconKey =
          Key(TOGGLE_THEME_ACTION_BUTTON_DARK_MODE_ICON_KEY_VALUE);

      Finder toggleThemeActionButtonElement =
          find.byKey(toggleThemeActionButtonKey);

      await tester.tap(toggleThemeActionButtonElement);

      await tester.pump();

      Finder toggleThemeActionButtonDarkModeIconElement =
          find.byKey(toggleThemeActionButtonDarkModeIconKey);

      expect(toggleThemeActionButtonDarkModeIconElement, findsOneWidget);
    });
    testWidgets(
        "Test If User Interface Stores Last Session Calculation Expression",
        (WidgetTester tester) async {
      await CalculationExpressionStoreMock.mockInitialExpression(
          SIMPLE_EXPRESSION);

      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Finder buttonOneElement =
          find.text(UserInterfaceCalculatorCharacters.ONE.value);
      Finder buttonAdditionElement =
          find.text(UserInterfaceCalculatorCharacters.ADDITION.value);

      await tester.tap(buttonOneElement);
      await tester.tap(buttonAdditionElement);
      await tester.tap(buttonOneElement);

      String storedExpression =
          await CalculationExpressionStoreMock.getStoredExpression();

      expect(storedExpression, SIMPLE_EXPRESSION);
    });

    testWidgets("Test If User Interface Stores Theme",
        (WidgetTester tester) async {
      await ThemeStoreMock.mockInitialThemeState(true);

      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Key toggleThemeActionButtonKey =
          Key(TOGGLE_THEME_ACTION_BUTTON_KEY_VALUE);

      Finder toggleThemeActionButtonElement =
          find.byKey(toggleThemeActionButtonKey);

      await tester.tap(toggleThemeActionButtonElement);

      bool storedTheme = await ThemeStoreMock.getStoredThemeState();

      expect(storedTheme, true);
    });
  });
}
