import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/episode_page_model.dart';
import 'package:moovee_land/core/models/season_page_model.dart';
import 'package:moovee_land/router/routes.dart';

class NavigationController {
  static void goToIntroPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteAliasData.intro);
  }

  static void goToLoginPage(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteAliasData.login, (route) => false);
  }

  static void goToHomePage(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouteAliasData.home, (route) => false);
  }

  static void goToMoviePage(BuildContext context, int id) {
    Navigator.of(context).pushNamed(RouteAliasData.movieInfo, arguments: id);
  }

  static void replaceMoviePage(BuildContext context, int id) {
    Navigator.of(context)
        .pushReplacementNamed(RouteAliasData.movieInfo, arguments: id);
  }

  static void goToTrailerPage(BuildContext context, String key) {
    Navigator.of(context)
        .pushNamed(RouteAliasData.mediaTrailer, arguments: key);
  }

  static void goToShowPage(BuildContext context, int id) {
    Navigator.of(context).pushNamed(RouteAliasData.showInfo, arguments: id);
  }

  static void replaceShowPage(BuildContext context, int id) {
    Navigator.of(context)
        .pushReplacementNamed(RouteAliasData.showInfo, arguments: id);
  }

  static void goToShowSeasonsPage(BuildContext context, int id) {
    Navigator.of(context)
        .pushNamed(RouteAliasData.showAllSeasons, arguments: id);
  }

  static void goToSeasonPage(BuildContext context, ShowSeasonData data) {
    Navigator.of(context).pushNamed(RouteAliasData.season, arguments: data);
  }

  static void goToEpisodePage(BuildContext context, ShowEpisodeData data) {
    Navigator.of(context).pushNamed(RouteAliasData.episode, arguments: data);
  }

  static void goToMovieCastPage(BuildContext context, int movieId) {
    Navigator.of(context)
        .pushNamed(RouteAliasData.movieFullCast, arguments: movieId);
  }

  static void goToShowCastPage(BuildContext context, int showId) {
    Navigator.of(context)
        .pushNamed(RouteAliasData.showFullCast, arguments: showId);
  }

  static void goToCastPage(BuildContext context, int castId) {
    Navigator.of(context).pushNamed(RouteAliasData.cast, arguments: castId);
  }
}
