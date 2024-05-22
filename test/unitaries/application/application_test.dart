import 'package:calculatorapp/application/application.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Application", () {
    late Calculator calculator;

    setUpAll(() {
      CalculationExpression calculationExpression =
          CalculationExpression(SIMPLE_EXPRESSION);
      CalculationExpressionRegister calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
      CalculationExpressionActiveRecord calculationExpressionActiveRecord =
          CalculationExpressionActiveRecordDecorator(
              calculationExpressionRegister);

      calculator = Calculator(calculationExpressionActiveRecord);
    });

    testWidgets("Test If Application Data Is Set On State Manager",
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
  });
}
