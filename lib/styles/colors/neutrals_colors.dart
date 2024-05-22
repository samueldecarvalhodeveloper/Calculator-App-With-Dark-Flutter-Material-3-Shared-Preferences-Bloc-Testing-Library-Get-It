import 'dart:ui';

import 'package:flutter/services.dart';

enum NeutralsColors {
  NEUTRAL_000(Color.fromRGBO(255, 255, 255, 1)),

  NEUTRAL_100(Color.fromRGBO(238, 242, 246, 1)),

  NEUTRAL_200(Color.fromRGBO(203, 207, 211, 1)),

  NEUTRAL_300(Color.fromRGBO(177, 180, 184, 1)),

  NEUTRAL_400(Color.fromRGBO(134, 139, 143, 1)),

  NEUTRAL_500(Color.fromRGBO(115, 118, 121, 1)),

  NEUTRAL_600(Color.fromRGBO(80, 82, 84, 1)),

  NEUTRAL_700(Color.fromRGBO(65, 67, 68, 1)),

  NEUTRAL_800(Color.fromRGBO(47, 48, 50, 1)),

  NEUTRAL_900(Color.fromRGBO(16, 16, 17, 1)),

  NEUTRAL_1000(Color.fromRGBO(0, 0, 0, 1));

  final Color value;

  const NeutralsColors(this.value);
}
