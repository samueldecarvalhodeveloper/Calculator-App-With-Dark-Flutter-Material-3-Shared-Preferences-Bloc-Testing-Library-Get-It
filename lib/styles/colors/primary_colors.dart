import 'dart:ui';

enum PrimaryColors {
  PRIMARY_100(Color.fromRGBO(231, 243, 255, 1)),

  PRIMARY_200(Color.fromRGBO(178, 216, 255, 1)),

  PRIMARY_300(Color.fromRGBO(143, 200, 255, 1)),

  PRIMARY_400(Color.fromRGBO(128, 192, 255, 1)),

  PRIMARY_500(Color.fromRGBO(30, 144, 255, 1)),

  PRIMARY_600(Color.fromRGBO(19, 111, 200, 1)),

  PRIMARY_700(Color.fromRGBO(17, 85, 151, 1)),

  PRIMARY_800(Color.fromRGBO(11, 57, 101, 1)),

  PRIMARY_900(Color.fromRGBO(7, 46, 84, 1));

  final Color value;

  const PrimaryColors(this.value);
}
