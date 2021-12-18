import 'package:flutter/material.dart';
import 'package:moovee_land/router/error_page.dart';
import 'package:moovee_land/app/home/home_page.dart';
import 'package:moovee_land/app/login/login_page.dart';
import 'package:moovee_land/app/movie/movie_page.dart';

class RouteAliasData {
  static const String login = '/login';
  static const String home = '/home';
  static const String movieInfo = '/home/movie';
}

abstract class RouteData {
  static const String initialRoute = '/login';

  static Map<String, WidgetBuilder> routes = {
    RouteAliasData.login: (context) => const LoginPage(),
    RouteAliasData.home: (context) => const HomePage(),
  };

  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteAliasData.movieInfo:
        final arguments = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => MoviePage(id: arguments),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ErrorPage(errorText: 'Page not found'),
        );
    }
  }

  static unknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const ErrorPage(
        errorText: 'Page not found',
      ),
    );
  }
}
