import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/dependencies_injector/dependencies_injector.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Test Class DependenciesInjector", () {
    setUpAll(() async {
      Map<String, Object> sharedPreferencesMap = {
        CALCULATION_EXPRESSION_KEY: SIMPLE_EXPRESSION
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);
    });

    test(
        "Test If Method \"setupDependencies\" Sets Up All Application Dependencies",
        () async {
      DependenciesInjector.setupDependencies();

      GetIt getIt = GetIt.instance;

      await getIt.allReady();

      Calculator calculator = getIt.get<Calculator>();

      String initialCalculatorExpression = calculator.getExpression();

      expect(initialCalculatorExpression, SIMPLE_EXPRESSION);
    });
  });
}
