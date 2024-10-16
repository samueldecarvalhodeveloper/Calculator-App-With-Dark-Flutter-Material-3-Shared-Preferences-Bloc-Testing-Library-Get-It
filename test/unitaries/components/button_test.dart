import 'package:calculatorapp/components/button.dart';
import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/styles/colors/neutrals_colors.dart';
import 'package:calculatorapp/styles/colors/primary_colors.dart';
import 'package:calculatorapp/user_interface_calculator_characters/user_interface_calculator_characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../adapters/user_interface_component_pumping_adapter.dart';

void main() {
  group("Test Widget Button", () {
    testWidgets("Test If Widget Is Rendered And Dispatches Action When Tapped",
        (WidgetTester tester) async {
      String changeableVariable = "";

      await UserInterfaceComponentPumpingAdapter.pumpWidget(
          tester,
          Button(
              UserInterfaceCalculatorCharacters.ONE.value,
              NeutralsColors.NEUTRAL_900.value,
              PrimaryColors.PRIMARY_400.value,
              PrimaryColors.PRIMARY_500.value,
              false,
              const EdgeInsets.all(0),
              null, () {
            changeableVariable = SIMPLE_EXPRESSION;
          }));

      Finder characterElement =
          find.text(UserInterfaceCalculatorCharacters.ONE.value);

      await tester.tap(characterElement);

      expect(changeableVariable, SIMPLE_EXPRESSION);
    });
  });
}
