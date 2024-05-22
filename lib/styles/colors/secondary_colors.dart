import 'dart:ui';

enum SecondaryColors {
  SECONDARY_100(Color.fromRGBO(254, 244, 205, 1)),

  SECONDARY_200(Color.fromRGBO(253, 238, 181, 1)),

  SECONDARY_300(Color.fromRGBO(251, 227, 132, 1)),

  SECONDARY_400(Color.fromRGBO(249, 215, 83, 1)),

  SECONDARY_500(Color.fromRGBO(250, 204, 21, 1)),

  SECONDARY_600(Color.fromRGBO(193, 158, 16, 1)),

  SECONDARY_700(Color.fromRGBO(176, 144, 16, 1)),

  SECONDARY_800(Color.fromRGBO(147, 121, 18, 1)),

  SECONDARY_900(Color.fromRGBO(117, 96, 14, 1));

  final Color value;

  const SecondaryColors(this.value);
}
