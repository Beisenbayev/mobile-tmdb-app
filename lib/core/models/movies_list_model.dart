import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movie.dart';
import 'package:moovee_land/client_api/home_service.dart';

class MoviesListModel extends ChangeNotifier {
  final _homeService = HomeService();
  final _timeFormat = DateFormat.yMMMMd().format;
  final List<Movie> _movies = [];

  List<Movie> get movies => List.unmodifiable(_movies);

  MoviesListModel() {
    handleLoadMovies();
  }

  void handleLoadMovies() async {
    _movies.clear();
    try {
      final loadedMovies = await _homeService.getPopularMovies();
      _movies.addAll(loadedMovies.movies);
    } catch (_) {}
    notifyListeners();
  }

  String getImageName(String? path) {
    return (path != null) ? ApiUtils.getImageUrl(path) : '';
  }

  String parseDateTime(DateTime? date) {
    return (date != null) ? _timeFormat(date) : '';
  }
}

class MoviesListProvider extends InheritedNotifier {
  final MoviesListModel model;

  const MoviesListProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static MoviesListProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MoviesListProvider>();
  }

  @override
  bool updateShouldNotify(MoviesListProvider oldWidget) {
    return true;
  }
}
