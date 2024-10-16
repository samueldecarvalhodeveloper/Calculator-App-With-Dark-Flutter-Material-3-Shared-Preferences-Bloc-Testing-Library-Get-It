import 'package:calculatorapp/application/application.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/user_interface_calculator_characters/user_interface_calculator_characters.dart';
import 'package:flutter_test/flutter_test.dart';

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

    testWidgets("Test If Calculation Expression Is Executed On User Interface",
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
  });
}
