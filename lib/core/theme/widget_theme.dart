import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/text_theme.dart';

import 'colors_theme.dart';

class WidgetThemeShelf {
  static const appBarTheme = AppBarTheme(
    backgroundColor: ColorThemeShelf.elementMainBackground,
    foregroundColor: ColorThemeShelf.elementForeground,
    titleTextStyle: TextThemeShelf.appBarTitle,
    centerTitle: true,
  );

  static final navigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: ColorThemeShelf.elementMainBackground,
    selectedItemColor: ColorThemeShelf.elementForeground,
    unselectedItemColor: ColorThemeShelf.elementForeground.withOpacity(0.3),
  );
}
