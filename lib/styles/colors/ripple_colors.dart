import 'dart:ui';

import 'package:flutter/services.dart';

enum RippleColors {
  LIGHT_MODE(Color.fromRGBO(0, 0, 0, 170)),

  DARK_MODE(Color.fromRGBO(255, 255, 255, 170));

  final Color value;

  const RippleColors(this.value);
}
