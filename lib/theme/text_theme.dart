import 'package:flutter/material.dart';
import 'colors_theme.dart';

abstract class TextStyleTheme {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: ColorPaletteTheme.elementForeground,
  );

  static const TextStyle itemTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorPaletteTheme.foreground,
  );

  static const TextStyle itemTitleWhite = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorPaletteTheme.subtitle,
  );

  static const TextStyle subtitleCursive  = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: ColorPaletteTheme.subtitle,
  );

  static const TextStyle main = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorPaletteTheme.foreground,
  );

  static const TextStyle mainBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorPaletteTheme.foreground,
  );

  static const TextStyle mainWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle mainBoldWhite = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorPaletteTheme.foreground,
  );

  static const TextStyle smallWhite = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle smallBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorPaletteTheme.foreground,
  );

  static const TextStyle smallBoldWhite = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorPaletteTheme.foreground,
  );

  static const TextStyle error = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorPaletteTheme.error,
  );
}
