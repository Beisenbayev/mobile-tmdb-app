import 'package:flutter/material.dart';

abstract class TextStyleTheme {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 24, 
    fontWeight: FontWeight.w600,
    color: Colors.white
  );

  static const TextStyle main = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black
  );

  static const TextStyle error = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color.fromRGBO(172, 84, 84, 1),
  );
}
