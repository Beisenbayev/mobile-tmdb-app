import 'package:flutter/material.dart';
import 'package:moovee_land/router/error_page.dart';
import 'package:moovee_land/app/home/home_page.dart';
import 'package:moovee_land/app/login/login_page.dart';
import 'package:moovee_land/app/movie/movie_page.dart';

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
