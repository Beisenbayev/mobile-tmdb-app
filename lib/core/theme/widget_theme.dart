import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/text_theme.dart';

import 'colors_theme.dart';

class WidgetThemeShelf {
  static const appBarTheme = AppBarTheme(
    backgroundColor: ColorThemeShelf.mainBackground,
    foregroundColor: ColorThemeShelf.whiteForeground,
    titleTextStyle: TextThemeShelf.appBarTitle,
    centerTitle: true,
  );

  static final navigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: ColorThemeShelf.mainBackground,
    selectedItemColor: ColorThemeShelf.whiteForeground,
    unselectedItemColor: ColorThemeShelf.whiteForeground.withOpacity(0.3),
  );

  static final roundedCardTheme = BoxDecoration(
    border: Border.all(
      width: 1,
      color: ColorThemeShelf.borderColor,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(6)),
    color: Colors.white,
  );
}
