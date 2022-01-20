import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/app_model.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/router/routes.dart';

class App extends StatelessWidget {
  final AppModel model;
  const App({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MooVeeLand',
      theme: ThemeData(
        appBarTheme: WidgetThemeShelf.appBarTheme,
        bottomNavigationBarTheme: WidgetThemeShelf.navigationBarTheme,
      ),
      routes: RouteData.routes,
      initialRoute: RouteData.initialRoute(model.isAuth),
      onGenerateRoute: (settings) => RouteData.onGenerateRoute(settings),
      onUnknownRoute: (settings) => RouteData.unknownRoute(settings),
    );
  }
}
