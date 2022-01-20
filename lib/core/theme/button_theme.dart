import 'package:flutter/material.dart';
import 'colors_theme.dart';

abstract class ButtonThemeShelf {
  static ButtonStyle elevatedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      ColorThemeShelf.elementSecondaryBackground,
    ),
    foregroundColor: MaterialStateProperty.all(
      ColorThemeShelf.elementForeground,
    ),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20,
      ),
    ),
  );

  static ButtonStyle elevatedButtonDisabled = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      ColorThemeShelf.elementSecondaryBackground.withOpacity(0.4),
    ),
    foregroundColor: MaterialStateProperty.all(
      ColorThemeShelf.elementForeground,
    ),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20,
      ),
    ),
  );

  static ButtonStyle textButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(
      ColorThemeShelf.elementSecondaryBackground,
    ),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ButtonStyle outlinedGrayButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      Colors.black.withOpacity(0.1),
    ),
    foregroundColor: MaterialStateProperty.all(ColorThemeShelf.foreground),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
