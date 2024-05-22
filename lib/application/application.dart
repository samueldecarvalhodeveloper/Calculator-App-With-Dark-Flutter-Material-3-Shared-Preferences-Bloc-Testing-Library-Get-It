import 'package:calculatorapp/cubits/calculation_expression_cubit.dart';
import 'package:calculatorapp/cubits/theme_cubit.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  final Calculator _calculator;
  final bool _initialThemeState;

  const Application(this._calculator, this._initialThemeState, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                CalculationExpressionCubit(_calculator)),
        BlocProvider(
            create: (BuildContext context) => ThemeCubit(_initialThemeState))
      ],
      child: MaterialApp(
        home: BlocBuilder<CalculationExpressionCubit, String>(
          builder: (BuildContext context, String calculationExpression) {
            return BlocBuilder<ThemeCubit, bool>(
                builder: (BuildContext context, bool isThemeDark) {
              return CalculatorScreen(calculationExpression, isThemeDark);
            });
          },
        ),
      ),
    );
  }
}
