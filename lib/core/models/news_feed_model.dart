import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movie.dart';
import 'package:moovee_land/client_api/home_service.dart';

class NewsFeedModel extends ChangeNotifier {
  final _homeService = HomeService();
  final _timeFormat = DateFormat.yMMMd().format;

  final List<String> _moviesTypes =
      List.unmodifiable(['Top Rated', 'Popular', 'Now Paying', 'Upcoming']);
  final List<String> _showsTypes =
      List.unmodifiable(['Top Rated', 'Popular', 'Now Paying', 'Upcoming']);
  final List<String> _trandingTypes = List.unmodifiable(['Today', 'Week']);

  final List<Movie> _movies = [];
  final List<Movie> _shows = [];
  final List<Movie> _tranding = [];

  List<Movie> get movies => List.unmodifiable(_movies);
  List<Movie> get shows => List.unmodifiable(_shows);
  List<Movie> get tranding => List.unmodifiable(_tranding);

  List<String> get moviesTypes => _moviesTypes;
  List<String> get showsTypes => _showsTypes;
  List<String> get trandingTypes => _trandingTypes;

  String getImageName(String? path) {
    return (path != null) ? ApiUtils.getImageUrl(path) : '';
  }

  String parseDateTime(DateTime? date) {
    return (date != null) ? _timeFormat(date) : '';
  }
}

class NewsFeedProvider extends InheritedNotifier {
  final NewsFeedModel model;

  const NewsFeedProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static NewsFeedProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewsFeedProvider>();
  }

  @override
  bool updateShouldNotify(NewsFeedProvider oldWidget) {
    return true;
  }
}
