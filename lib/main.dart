import 'package:calculatorapp/application/application.dart';
import 'package:calculatorapp/dependencies_injector/dependencies_injector.dart';
import 'package:calculatorapp/domains/calculator/calculator.dart';
import 'package:calculatorapp/theme_store/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt getIt = GetIt.instance;

  DependenciesInjector.setupDependencies();

  await getIt.allReady();

  Calculator calculator = getIt.get<Calculator>();
  bool initialThemeState = await ThemeStore.getStoredThemeState();

  Application application = Application(calculator, initialThemeState);

  runApp(application);
}
