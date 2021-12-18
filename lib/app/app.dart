import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/router/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MooVeeLand',
      theme: ThemeData(
        appBarTheme: WidgetStyleTheme.appBarTheme,
        bottomNavigationBarTheme: WidgetStyleTheme.navigationBarTheme,
      ),
      routes: RouteData.routes,
      initialRoute: RouteData.initialRoute,
      onGenerateRoute: (settings) => RouteData.onGenerateRoute(settings),
      onUnknownRoute: (settings) => RouteData.unknownRoute(settings),
    );
  }
}
