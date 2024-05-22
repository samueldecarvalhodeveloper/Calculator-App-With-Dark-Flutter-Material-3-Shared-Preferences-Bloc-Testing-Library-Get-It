import 'package:calculatorapp/constants/user_interface_constants.dart';

class UserInterfaceSpecifications {
  static bool isRetrievedValueEqualToNull(Object? retrievedValue) {
    return retrievedValue == null;
  }

  static bool isScreenHeightSmall(double screenHeight) {
    return screenHeight < SMALL_SCREEN_HEIGHT;
  }
}
