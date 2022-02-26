import 'package:flutter/material.dart';
import 'package:moovee_land/app/media_trailer/media_trailer_page.dart';
import 'package:moovee_land/app/show/show_page.dart';
import 'package:moovee_land/app/show_episodes/show_episodes_page.dart';
import 'package:moovee_land/app/show_seasons/show_seasons_page.dart';
import 'package:moovee_land/core/models/login_page_model.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/models/show_episodes_model.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
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
  static const String mediaTrailer = 'home/media/trailer';
  static const String showInfo = 'home/show';
  static const String showSeasons = 'home/show/seasons';
  static const String showEpisodes = 'home/show/seasons/episodes';
}

abstract class RouteData {
  static String initialRoute = RouteAliasData.intro;

  static Map<String, WidgetBuilder> routes = {
    RouteAliasData.intro: (context) => const IntroPage(),
    RouteAliasData.home: (context) => const HomePage(),
  };

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
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

      case RouteAliasData.mediaTrailer:
        final youTubeKey = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MediaTrailerPage(youTubeKey),
        );

      case RouteAliasData.showInfo:
        final showId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ShowPageModel(showId),
            child: const ShowPage(),
          ),
        );

      case RouteAliasData.showSeasons:
        final showId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ShowPageModel(showId),
            child: const ShowSeasonsPage(),
          ),
        );

      case RouteAliasData.showEpisodes:
        final data = settings.arguments as ShowEpisodeData;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ShowEpisodesModel(data),
            child: const ShowEpisodesPage(),
          ),
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
