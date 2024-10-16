import 'package:calculatorapp/application/application.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/user_interface_calculator_characters/user_interface_calculator_characters.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Calculator Screen", () {
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

    setUp(() {
      calculator.clean();
    });

    testWidgets(
        "Test If All Numerical Buttons Are Set And Add Its Character To Viewfinder",
        (WidgetTester tester) async {
      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Finder buttonZeroElement =
          find.text(UserInterfaceCalculatorCharacters.ZERO.value);
      Finder buttonOneElement =
          find.text(UserInterfaceCalculatorCharacters.ONE.value);
      Finder buttonTwoElement =
          find.text(UserInterfaceCalculatorCharacters.TWO.value);
      Finder buttonThreeElement =
          find.text(UserInterfaceCalculatorCharacters.THREE.value);
      Finder buttonFourElement =
          find.text(UserInterfaceCalculatorCharacters.FOUR.value);
      Finder buttonFiveElement =
          find.text(UserInterfaceCalculatorCharacters.FIVE.value);
      Finder buttonSixElement =
          find.text(UserInterfaceCalculatorCharacters.SIX.value);
      Finder buttonSevenElement =
          find.text(UserInterfaceCalculatorCharacters.SEVEN.value);
      Finder buttonEightElement =
          find.text(UserInterfaceCalculatorCharacters.EIGHT.value);
      Finder buttonNineElement =
          find.text(UserInterfaceCalculatorCharacters.NINE.value);

      await tester.tap(buttonZeroElement);
      await tester.tap(buttonOneElement);
      await tester.tap(buttonTwoElement);
      await tester.tap(buttonThreeElement);
      await tester.tap(buttonFourElement);
      await tester.tap(buttonFiveElement);
      await tester.tap(buttonSixElement);
      await tester.tap(buttonSevenElement);
      await tester.tap(buttonEightElement);
      await tester.tap(buttonNineElement);

      await tester.pump();

      Finder viewfinderElement =
          find.text(CALCULATION_EXPRESSION_WITH_ALL_NUMERICAL_CHARACTERS);

      expect(viewfinderElement, findsOneWidget);
    });

    testWidgets(
        "Test If All Operator Buttons Are Set And Add Its Character To Viewfinder",
        (WidgetTester tester) async {
      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Finder buttonAdditionElement =
          find.text(UserInterfaceCalculatorCharacters.ADDITION.value);
      Finder buttonSubtractionElement =
          find.text(UserInterfaceCalculatorCharacters.SUBTRACTION.value);
      Finder buttonMultiplicationElement =
          find.text(UserInterfaceCalculatorCharacters.MULTIPLICATION.value);
      Finder buttonDivisionElement =
          find.text(UserInterfaceCalculatorCharacters.DIVISION.value);

      await tester.tap(buttonAdditionElement);
      await tester.tap(buttonSubtractionElement);
      await tester.tap(buttonMultiplicationElement);
      await tester.tap(buttonDivisionElement);

      await tester.pump();

      Finder viewfinderElement =
          find.text(CALCULATION_EXPRESSION_WITH_ALL_OPERATOR_CHARACTERS);

      expect(viewfinderElement, findsOneWidget);
    });

    testWidgets(
        "Test If All Symbolic Buttons Are Set And Add Its Character To Viewfinder",
        (WidgetTester tester) async {
      await tester.pumpWidget(Application(calculator, THEME_INITIAL_STATE));

      Finder buttonPointElement =
          find.text(UserInterfaceCalculatorCharacters.POINT.value);

      await tester.tap(buttonPointElement);
      await tester.tap(buttonPointElement);

      await tester.pump();

      expect(
          find.text(UserInterfaceCalculatorCharacters.POINT.value +
              UserInterfaceCalculatorCharacters.POINT.value),
          findsOneWidget);
    });

    testWidgets("Test If Theme Is Toggled", (WidgetTester tester) async {
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
  });
}
