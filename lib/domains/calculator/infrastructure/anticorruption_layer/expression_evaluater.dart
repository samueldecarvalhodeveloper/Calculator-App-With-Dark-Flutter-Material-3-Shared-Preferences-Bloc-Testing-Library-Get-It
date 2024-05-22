import 'package:calculatorapp/constants/domains/calculator_constants.dart';
import 'package:eval_ex/expression.dart';

class ExpressionEvaluater {
  static String getEvaluatedExpression(String expression) {
    try {
      return Expression(expression).eval().toString();
    } catch (e) {
      return NOT_VALID_EXPRESSION_ERROR_MESSAGE;
    }
  }
}
