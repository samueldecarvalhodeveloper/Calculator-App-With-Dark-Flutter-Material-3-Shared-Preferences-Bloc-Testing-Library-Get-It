import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/cubits/theme_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Test Class ThemeCubit", () {
    ThemeCubit themeCubit = ThemeCubit(THEME_INITIAL_STATE);

    setUpAll(() {
      Map<String, Object> sharedPreferencesMap = {
        THEME_KEY: THEME_INITIAL_STATE
      };

      SharedPreferences.setMockInitialValues(sharedPreferencesMap);
    });

    test("Test If Initial State Is Set", () {
      bool initialState = themeCubit.state;

      expect(initialState, THEME_INITIAL_STATE);
    });

    test("Test If Method \"toggleTheme\" Toggles Theme State", () {
      themeCubit.toggleTheme();

      bool initialState = themeCubit.state;

      expect(initialState, true);
    });
  });
}
