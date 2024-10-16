class CalculatorFormatter {
  static String getCalculationExpressionWithoutLastCharacter(
      String calculationExpression) {
    return calculationExpression.substring(
        0, calculationExpression.length - 1);
  }
}
