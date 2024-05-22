import 'package:calculatorapp/constants/user_interface_constants.dart';

class NotExistingKeyException implements Exception {
  final String key;

  const NotExistingKeyException(this.key);

  @override
  String toString() => NOT_EXISTING_KEY_EXCEPTION_MESSAGE(key);
}
