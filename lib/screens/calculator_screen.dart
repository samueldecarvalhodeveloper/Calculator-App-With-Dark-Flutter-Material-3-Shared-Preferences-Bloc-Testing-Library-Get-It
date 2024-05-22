import 'package:calculatorapp/components/button.dart';
import 'package:calculatorapp/components/keyboard.dart';
import 'package:calculatorapp/components/viewfinder.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/cubits/calculation_expression_cubit.dart';
import 'package:calculatorapp/cubits/theme_cubit.dart';
import 'package:calculatorapp/domains/calculator/calculator_characters.dart';
import 'package:calculatorapp/styles/colors/neutrals_colors.dart';
import 'package:calculatorapp/styles/colors/primary_colors.dart';
import 'package:calculatorapp/styles/colors/secondary_colors.dart';
import 'package:calculatorapp/user_interface_calculator_characters/user_interface_calculator_characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  final String _calculationExpression;
  final bool _isThemeDark;

  const CalculatorScreen(this._calculationExpression, this._isThemeDark,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  key: Key(TOGGLE_THEME_ACTION_BUTTON_KEY_VALUE),
                  icon: Icon(
                    _isThemeDark ? Icons.nightlight : Icons.light_mode,
                    key: _isThemeDark
                        ? Key(
                            TOGGLE_THEME_ACTION_BUTTON_DARK_MODE_ICON_KEY_VALUE)
                        : Key(
                            TOGGLE_THEME_ACTION_BUTTON_LIGHT_MODE_ICON_KEY_VALUE),
                  ),
                  color: _isThemeDark
                      ? NeutralsColors.NEUTRAL_100.value
                      : NeutralsColors.NEUTRAL_900.value,
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ))
          ],
          backgroundColor: _isThemeDark
              ? PrimaryColors.PRIMARY_700.value
              : PrimaryColors.PRIMARY_100.value,
        ),
        backgroundColor: _isThemeDark
            ? PrimaryColors.PRIMARY_900.value
            : PrimaryColors.PRIMARY_200.value,
        body: Column(children: [
          Viewfinder(_calculationExpression, _isThemeDark),
          Keyboard(
            [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Button(
                          UserInterfaceCalculatorCharacters.CLEAN.value,
                          NeutralsColors.NEUTRAL_900.value,
                          SecondaryColors.SECONDARY_500.value,
                          _isThemeDark
                              ? SecondaryColors.SECONDARY_300.value
                              : SecondaryColors.SECONDARY_600.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context.read<CalculationExpressionCubit>().clean();
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.DIVISION.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_900.value
                              : NeutralsColors.NEUTRAL_100.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_400.value
                              : PrimaryColors.PRIMARY_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_300.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.DIVISION);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters
                              .MULTIPLICATION.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_900.value
                              : NeutralsColors.NEUTRAL_100.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_400.value
                              : PrimaryColors.PRIMARY_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_300.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.MULTIPLICATION);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.BACKSPACE.value,
                          NeutralsColors.NEUTRAL_900.value,
                          SecondaryColors.SECONDARY_500.value,
                          _isThemeDark
                              ? SecondaryColors.SECONDARY_300.value
                              : SecondaryColors.SECONDARY_600.value,
                          _isThemeDark,
                          const EdgeInsets.only(
                            bottom: 8,
                          ),
                          null, () {
                        context.read<CalculationExpressionCubit>().backspace();
                      }),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Button(
                          UserInterfaceCalculatorCharacters.SEVEN.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_100.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_700.value
                              : PrimaryColors.PRIMARY_400.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_600.value
                              : PrimaryColors.PRIMARY_500.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.SEVEN);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.EIGHT.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_100.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_700.value
                              : PrimaryColors.PRIMARY_400.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_600.value
                              : PrimaryColors.PRIMARY_500.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.EIGHT);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.NINE.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_100.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_700.value
                              : PrimaryColors.PRIMARY_400.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_600.value
                              : PrimaryColors.PRIMARY_500.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.NINE);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.SUBTRACTION.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_900.value
                              : NeutralsColors.NEUTRAL_100.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_400.value
                              : PrimaryColors.PRIMARY_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_300.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark,
                          const EdgeInsets.only(bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.SUBTRACTION);
                      }),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Button(
                          UserInterfaceCalculatorCharacters.FOUR.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_100.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_700.value
                              : PrimaryColors.PRIMARY_400.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_600.value
                              : PrimaryColors.PRIMARY_500.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.FOUR);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.FIVE.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_100.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_700.value
                              : PrimaryColors.PRIMARY_400.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_600.value
                              : PrimaryColors.PRIMARY_500.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.FIVE);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.SIX.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_100.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_700.value
                              : PrimaryColors.PRIMARY_400.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_600.value
                              : PrimaryColors.PRIMARY_500.value,
                          _isThemeDark,
                          const EdgeInsets.only(right: 8, bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.SIX);
                      }),
                      Button(
                          UserInterfaceCalculatorCharacters.ADDITION.value,
                          _isThemeDark
                              ? NeutralsColors.NEUTRAL_900.value
                              : NeutralsColors.NEUTRAL_100.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_400.value
                              : PrimaryColors.PRIMARY_900.value,
                          _isThemeDark
                              ? PrimaryColors.PRIMARY_300.value
                              : NeutralsColors.NEUTRAL_900.value,
                          _isThemeDark,
                          const EdgeInsets.only(bottom: 8),
                          null, () {
                        context
                            .read<CalculationExpressionCubit>()
                            .addCharacter(CalculatorCharacters.ADDITION);
                      }),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Button(
                                        UserInterfaceCalculatorCharacters
                                            .ONE.value,
                                        _isThemeDark
                                            ? NeutralsColors.NEUTRAL_100.value
                                            : NeutralsColors.NEUTRAL_900.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_700.value
                                            : PrimaryColors.PRIMARY_400.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_600.value
                                            : PrimaryColors.PRIMARY_500.value,
                                        _isThemeDark,
                                        const EdgeInsets.only(
                                            right: 8, bottom: 8),
                                        null, () {
                                      context
                                          .read<CalculationExpressionCubit>()
                                          .addCharacter(
                                              CalculatorCharacters.ONE);
                                    }),
                                    Button(
                                        UserInterfaceCalculatorCharacters
                                            .TWO.value,
                                        _isThemeDark
                                            ? NeutralsColors.NEUTRAL_100.value
                                            : NeutralsColors.NEUTRAL_900.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_700.value
                                            : PrimaryColors.PRIMARY_400.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_600.value
                                            : PrimaryColors.PRIMARY_500.value,
                                        _isThemeDark,
                                        const EdgeInsets.only(
                                            right: 8, bottom: 8),
                                        null, () {
                                      context
                                          .read<CalculationExpressionCubit>()
                                          .addCharacter(
                                              CalculatorCharacters.TWO);
                                    }),
                                    Button(
                                        UserInterfaceCalculatorCharacters
                                            .THREE.value,
                                        _isThemeDark
                                            ? NeutralsColors.NEUTRAL_100.value
                                            : NeutralsColors.NEUTRAL_900.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_700.value
                                            : PrimaryColors.PRIMARY_400.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_600.value
                                            : PrimaryColors.PRIMARY_500.value,
                                        _isThemeDark,
                                        const EdgeInsets.only(
                                            right: 8, bottom: 8),
                                        null, () {
                                      context
                                          .read<CalculationExpressionCubit>()
                                          .addCharacter(
                                              CalculatorCharacters.THREE);
                                    }),
                                  ],
                                )),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Button(
                                        UserInterfaceCalculatorCharacters
                                            .ZERO.value,
                                        _isThemeDark
                                            ? NeutralsColors.NEUTRAL_100.value
                                            : NeutralsColors.NEUTRAL_900.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_700.value
                                            : PrimaryColors.PRIMARY_400.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_600.value
                                            : PrimaryColors.PRIMARY_500.value,
                                        _isThemeDark,
                                        const EdgeInsets.only(
                                            right: 8, bottom: 8),
                                        2, () {
                                      context
                                          .read<CalculationExpressionCubit>()
                                          .addCharacter(
                                              CalculatorCharacters.ZERO);
                                    }),
                                    Button(
                                        UserInterfaceCalculatorCharacters
                                            .POINT.value,
                                        _isThemeDark
                                            ? NeutralsColors.NEUTRAL_900.value
                                            : NeutralsColors.NEUTRAL_100.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_400.value
                                            : PrimaryColors.PRIMARY_900.value,
                                        _isThemeDark
                                            ? PrimaryColors.PRIMARY_300.value
                                            : NeutralsColors.NEUTRAL_900.value,
                                        _isThemeDark,
                                        const EdgeInsets.only(
                                            right: 8, bottom: 8),
                                        null, () {
                                      context
                                          .read<CalculationExpressionCubit>()
                                          .addCharacter(
                                              CalculatorCharacters.POINT);
                                    }),
                                  ],
                                )),
                              ],
                            )),
                        Button(
                            UserInterfaceCalculatorCharacters.EVALUATE.value,
                            NeutralsColors.NEUTRAL_900.value,
                            SecondaryColors.SECONDARY_500.value,
                            _isThemeDark
                                ? SecondaryColors.SECONDARY_300.value
                                : SecondaryColors.SECONDARY_600.value,
                            _isThemeDark,
                            const EdgeInsets.all(0),
                            null, () {
                          context.read<CalculationExpressionCubit>().evaluate();
                        }),
                      ],
                    ),
                  ))
            ],
          )
        ]));
  }
}
