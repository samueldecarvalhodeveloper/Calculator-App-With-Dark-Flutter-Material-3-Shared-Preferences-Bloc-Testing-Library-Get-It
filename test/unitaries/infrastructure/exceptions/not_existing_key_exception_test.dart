import 'package:calculatorapp/constants/user_interface_constants.dart';
import 'package:calculatorapp/infrastructure/exceptions/not_existing_key_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Class NotExistingKeyException", () {
    test("Test How Exception Should Used On Client", () {
      try {
        throw NotExistingKeyException(CALCULATION_EXPRESSION_KEY);
      } catch (e) {
        expect(e.toString(),
            NOT_EXISTING_KEY_EXCEPTION_MESSAGE(CALCULATION_EXPRESSION_KEY));
      }
    });
  });
}
