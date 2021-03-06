import 'package:flutter/material.dart';
import 'package:moovee_land/app/cast/cast_page.dart';
import 'package:moovee_land/app/episode/episode_page.dart';
import 'package:moovee_land/app/media_trailer/media_trailer_page.dart';
import 'package:moovee_land/app/movie_credits/movie_credits_page.dart';
import 'package:moovee_land/app/show/show_page.dart';
import 'package:moovee_land/app/season/season_page.dart';
import 'package:moovee_land/app/show_credits/show_credits_page.dart';
import 'package:moovee_land/app/show_seasons/show_seasons_page.dart';
import 'package:moovee_land/core/models/cast_page_model.dart';
import 'package:moovee_land/core/models/episode_page_model.dart';
import 'package:moovee_land/core/models/login_page_model.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/models/season_page_model.dart';
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
  static const String movieFullCast = 'home/movie/fullcast';
  static const String showInfo = 'home/show';
  static const String showFullCast = 'home/show/fullcast';
  static const String cast = 'home/cast';
  static const String mediaTrailer = 'home/trailer';
  static const String showAllSeasons = 'home/show/allSeasons';
  static const String season = 'home/show/allSeasons/season';
  static const String episode = 'home/show/allSeasons/season/episode';
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

      case RouteAliasData.showInfo:
        final showId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ShowPageModel(showId),
            child: const ShowPage(),
          ),
        );

      case RouteAliasData.mediaTrailer:
        final youTubeKey = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MediaTrailerPage(youTubeKey),
        );

      case RouteAliasData.showAllSeasons:
        final showId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ShowPageModel(showId),
            child: const ShowSeasonsPage(),
          ),
        );

      case RouteAliasData.season:
        final data = settings.arguments as ShowSeasonData;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => SeasonPageModel(data),
            child: const SeasonPage(),
          ),
        );

      case RouteAliasData.episode:
        final data = settings.arguments as ShowEpisodeData;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => EpisodePageModel(data),
            child: const EpisodePage(),
          ),
        );

      case RouteAliasData.movieFullCast:
        final movieId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => MoviePageModel(movieId),
            child: const MovieCreditsPage(),
          ),
        );

      case RouteAliasData.showFullCast:
        final showId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ShowPageModel(showId),
            child: const ShowCreditsPage(),
          ),
        );

      case RouteAliasData.cast:
        final castId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => CastPageModel(castId),
            child: const CastPage(),
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
