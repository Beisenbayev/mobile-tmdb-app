import 'package:flutter/material.dart';
import 'package:moovee_land/pages/error_page.dart';
import 'package:moovee_land/pages/home_page.dart';
import 'package:moovee_land/pages/login_page.dart';
import 'package:moovee_land/pages/movie_page.dart';

abstract class RouteData {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/home/movie': (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments;

      if (arguments is int) {
        return MoviePage(id: arguments);
      } else {
        return const MoviePage(id: 0);
      }
    }
  };

  static const String initialRoute = '/login';

  static unknownRoute() {
    return (RouteSettings settings) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => const ErrorPage(
          errorText: 'Page not found',
        ),
      );
    };
  }
}
