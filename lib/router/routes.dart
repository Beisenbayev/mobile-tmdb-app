import 'package:flutter/material.dart';
import 'package:moovee_land/app/movie_trailer/movie_trailer_page.dart';
import 'package:moovee_land/core/models/into_page_model.dart';
import 'package:moovee_land/core/models/login_page_model.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/router/error_page.dart';
import 'package:moovee_land/app/home/home_page.dart';
import 'package:moovee_land/app/login/login_page.dart';
import 'package:moovee_land/app/movie/movie_page.dart';
import 'package:moovee_land/router/intro_page.dart';
import 'package:provider/provider.dart';

class RouteAliasData {
  static const String intro = 'intro';
  static const String login = 'login';
  static const String home = 'home';
  static const String movieInfo = 'home/movie';
  static const String movieTrailer = 'home/movie/trailer';
}

abstract class RouteData {
  static String initialRoute = RouteAliasData.intro;

  static Map<String, WidgetBuilder> routes = {
    RouteAliasData.home: (context) => const HomePage(),
  };

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteAliasData.intro:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => IntroPageModel(),
            child: const IntroPage(),
          ),
        );

      case RouteAliasData.login:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => LoginPageModel(),
            child: const LoginPage(),
          ),
        );

      case RouteAliasData.movieInfo:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => MoviePageModel(movieId),
            child: const MoviePage(),
          ),
        );

      case RouteAliasData.movieTrailer:
        final youTubeKey = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MovieTrailerPage(youTubeKey),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ErrorPage(errorText: 'Page not found'),
        );
    }
  }

  static MaterialPageRoute unknownRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const ErrorPage(
        errorText: 'Page not found',
      ),
    );
  }
}
