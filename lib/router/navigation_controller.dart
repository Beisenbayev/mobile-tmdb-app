import 'package:flutter/material.dart';
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

  static void goToMoviePage(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.movieInfo);
  }

  static void goToTrailerPage(BuildContext context) {
    Navigator.of(context).pushNamed(RouteAliasData.movieTrailer);
  }
}
