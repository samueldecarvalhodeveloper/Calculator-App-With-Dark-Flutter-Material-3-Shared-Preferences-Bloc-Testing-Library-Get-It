import 'package:calculatorapp/components/keyboard.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Widget Keyboard", () {
    testWidgets("Test If Widget Is Rendered", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Column(
          children: [
            Keyboard([Text(SIMPLE_EXPRESSION)])
          ],
        ),
      ));

      Finder viewfinderValueTextWithSimpleCalculationExpression =
          find.text(SIMPLE_EXPRESSION);

      expect(
          viewfinderValueTextWithSimpleCalculationExpression, findsOneWidget);
    });
  });
}
