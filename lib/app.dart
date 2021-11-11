import 'package:flutter/material.dart';
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
        ),
      ),
      routes: RouteData.routes,
      initialRoute: RouteData.initialRoute,
      onUnknownRoute: RouteData.unknownRoute(),
    );
  }
}
