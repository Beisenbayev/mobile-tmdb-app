import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/show_episodes_model.dart';
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
    Navigator.of(context).pushNamed(RouteAliasData.showSeasons, arguments: id);
  }

  static void goToShowEpisodesPage(BuildContext context, ShowEpisodeData data) {
    Navigator.of(context)
        .pushNamed(RouteAliasData.showEpisodes, arguments: data);
  }
}
