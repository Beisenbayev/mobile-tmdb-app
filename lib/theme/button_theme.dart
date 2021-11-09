import 'package:flutter/material.dart';

abstract class ButtonStyleTheme {
  static ButtonStyle elevatedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      const Color.fromRGBO(1, 180, 228, 1),
    ),
    foregroundColor: MaterialStateProperty.all(Colors.white),
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
      const Color.fromRGBO(1, 180, 228, 1),
    ),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(1, 180, 228, 1),
      ),
    ),
  );
}
