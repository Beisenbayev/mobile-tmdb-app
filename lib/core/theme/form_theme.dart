import 'package:flutter/material.dart';

abstract class InputThemeShelf {
  static const InputDecoration outlined = InputDecoration(
      isCollapsed: true,
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ));
}
