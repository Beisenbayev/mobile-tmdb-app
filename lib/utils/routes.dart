import 'package:flutter/material.dart';
import 'package:moovee_land/pages/error_page.dart';
import 'package:moovee_land/pages/home_page.dart';
import 'package:moovee_land/pages/login_page.dart';

abstract class RouteData {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginPage(),
    '/home': (context) => const HomePage()
  };

  static const String initialRoute = '/login';

  static unknownRoute() {
    return (RouteSettings settings) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => const ErrorPage(errorText: 'Page not found')
      );
    };
  }
}
