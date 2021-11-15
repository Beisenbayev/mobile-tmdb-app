import 'package:flutter/material.dart';
import 'package:moovee_land/theme/text_theme.dart';
import 'package:moovee_land/utils/routes.dart';
import 'package:moovee_land/theme/colors_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MooVeeLand',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorPaletteTheme.elementMainBackground,
          foregroundColor: ColorPaletteTheme.elementForeground,
          titleTextStyle: TextStyleTheme.appBarTitle,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorPaletteTheme.elementMainBackground,
          selectedItemColor: ColorPaletteTheme.elementForeground,
          unselectedItemColor:
              ColorPaletteTheme.elementForeground.withOpacity(0.3),
        ),
      ),
      routes: RouteData.routes,
      initialRoute: RouteData.initialRoute,
      onUnknownRoute: RouteData.unknownRoute(),
    );
  }
}
