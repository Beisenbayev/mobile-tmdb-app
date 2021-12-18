import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/text_theme.dart';

import 'colors_theme.dart';

class WidgetStyleTheme {
  static const appBarTheme = AppBarTheme(
    backgroundColor: ColorPaletteTheme.elementMainBackground,
    foregroundColor: ColorPaletteTheme.elementForeground,
    titleTextStyle: TextStyleTheme.appBarTitle,
    centerTitle: true,
  );

  static final navigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: ColorPaletteTheme.elementMainBackground,
    selectedItemColor: ColorPaletteTheme.elementForeground,
    unselectedItemColor: ColorPaletteTheme.elementForeground.withOpacity(0.3),
  );
}
