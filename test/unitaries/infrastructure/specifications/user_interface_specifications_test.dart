import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/infrastructure/specifications/user_interface_specifications.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class UserInterfaceSpecifications", () {
    test(
        "Test If Method \"isRetrievedValueEqualToNull\" Returns True If Retrieved Value Equal To Null",
        () {
      bool retrievedValueIsNull =
          UserInterfaceSpecifications.isRetrievedValueEqualToNull(null);
      bool retrievedValueIsNotNull =
          UserInterfaceSpecifications.isRetrievedValueEqualToNull(
              SIMPLE_EXPRESSION);

      expect(retrievedValueIsNull, true);
      expect(retrievedValueIsNotNull, false);
    });

    test(
        "Test If Method \"isScreenHeightSmall\" Returns True If Device Screen Height Is Smaller Than Small Screen Height",
        () {
      bool screenIsSmall = UserInterfaceSpecifications.isScreenHeightSmall(
          SMALLER_SCREEN_HEIGHT);
      bool screenIsNotSmall = UserInterfaceSpecifications.isScreenHeightSmall(
          GREATER_SCREEN_HEIGHT);

      expect(screenIsSmall, true);
      expect(screenIsNotSmall, false);
    });
  });
}
