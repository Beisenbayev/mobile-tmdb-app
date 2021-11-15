import 'package:flutter/material.dart';

abstract class ColorPaletteTheme {
  static const elementMainBackground = Color.fromRGBO(3, 37, 65, 1);
  static const elementSecondaryBackground = Color.fromRGBO(1, 180, 228, 1);
  static const elementForeground = Colors.white;

  static const background = Colors.white;
  static const foreground = Colors.black;

  static const backgroundDark = Color.fromRGBO(27, 22, 26, 1.0);
  static const backgroundDarker = Color.fromRGBO(24, 20, 23, 1.0);

  static const radialPercentFill = Color.fromRGBO(8, 28, 34, 1.0);
  static const radialPercentFree = Color.fromRGBO(28, 63, 39, 1.0);
  static const radialPercentActive = Color.fromRGBO(33, 208, 122, 1.0);

  static const error = Color.fromRGBO(172, 84, 84, 1);
  static const subtitle = Color.fromRGBO(153, 153, 153, 1);
}
