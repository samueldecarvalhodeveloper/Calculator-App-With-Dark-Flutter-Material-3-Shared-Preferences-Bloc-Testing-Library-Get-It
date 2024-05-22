import 'package:calculatorapp/components/viewfinder.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Widget Viewfinder", () {
    testWidgets("Test If Widget Is Rendered", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Viewfinder(SIMPLE_EXPRESSION, THEME_INITIAL_STATE),
      ));

      Finder viewfinderValueText = find.text(SIMPLE_EXPRESSION);

      expect(viewfinderValueText, findsOneWidget);
    });
  });
}
