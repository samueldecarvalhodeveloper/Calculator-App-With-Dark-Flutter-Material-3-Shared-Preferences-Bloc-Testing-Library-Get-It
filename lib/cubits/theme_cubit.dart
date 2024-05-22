import 'package:calculatorapp/theme_store/theme_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  bool _themeState;

  ThemeCubit(this._themeState) : super(_themeState);

  void toggleTheme() {
    _themeState = !_themeState;

    ThemeStore.setStoredThemeState(_themeState);

    emit(_themeState);
  }
}
