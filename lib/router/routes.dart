import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/login_page_model.dart';
import 'package:moovee_land/router/error_page.dart';
import 'package:moovee_land/app/home/home_page.dart';
import 'package:moovee_land/app/login/login_page.dart';
import 'package:moovee_land/app/movie/movie_page.dart';

class RouteAliasData {
  static const String login = 'login';
  static const String home = 'home';
  static const String movieInfo = 'home/movie';
}

abstract class RouteData {
  static String initialRoute(bool isAuth) {
    return isAuth ? RouteAliasData.home : RouteAliasData.login;
  }

  static Map<String, WidgetBuilder> routes = {
    RouteAliasData.login: (context) {
      return LoginPageProvider(
        model: LoginPageModel(),
        child: const LoginPage(),
      );
    },
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
