enum UserInterfaceCalculatorCharacters {
  ZERO("0"),
  ONE("1"),
  TWO("2"),
  THREE("3"),
  FOUR("4"),
  FIVE("5"),
  SIX("6"),
  SEVEN("7"),
  EIGHT("8"),
  NINE("9"),
  ADDITION("+"),
  SUBTRACTION("-"),
  MULTIPLICATION("*"),
  DIVISION("/"),
  POINT("."),
  CLEAN("C"),
  BACKSPACE("<"),
  EVALUATE("=");

  final String value;

  const UserInterfaceCalculatorCharacters(this.value);
}
