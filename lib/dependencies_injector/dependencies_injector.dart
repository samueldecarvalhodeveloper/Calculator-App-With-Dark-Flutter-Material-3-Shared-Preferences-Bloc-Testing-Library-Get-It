import 'package:calculatorapp/calculation_expression_store/calculation_expression_store.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_active_record_decorator.dart';
import 'package:calculatorapp/domains/calculator/calculation_expression_register.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:get_it/get_it.dart';

class DependenciesInjector {
  static final GetIt _getIt = GetIt.instance;

  static void setupDependencies() {
    _getIt.registerSingletonAsync<Calculator>(() async {
      String storedCalculationExpression =
          await CalculationExpressionStore.getStoredExpression();

      CalculationExpression calculationExpression =
          CalculationExpression(storedCalculationExpression);
      CalculationExpressionRegister calculationExpressionRegister =
          CalculationExpressionRegister(calculationExpression);
      CalculationExpressionActiveRecordDecorator
          calculationExpressionActiveRecord =
          CalculationExpressionActiveRecordDecorator(
              calculationExpressionRegister);

      Calculator calculator = Calculator(calculationExpressionActiveRecord);

      return calculator;
    });
  }
}
