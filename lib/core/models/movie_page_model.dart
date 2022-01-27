import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/movie_service.dart';
import 'package:moovee_land/client_api/entity/movie_details.dart';

class MoviePageModel extends ChangeNotifier {
  final _movieService = MovieService();
  final _timeFormat = DateFormat.yMMMMd().format;
  final int _movieId;
  MovieDetails? _ditails;

  int get movieId => _movieId;
  MovieDetails? get ditails => _ditails;

  MoviePageModel(this._movieId) {
    _loadMovie();
  }

  void _loadMovie() async {
    _ditails = await _movieService.getMovieDetails(_movieId);
    notifyListeners();
  }
  
  String parseDateTime(DateTime? date) {
    return (date != null) ? _timeFormat(date) : '';
  }
}

class MoviePageProvider extends InheritedNotifier {
  final MoviePageModel model;

  const MoviePageProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static MoviePageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MoviePageProvider>();
  }

  @override
  bool updateShouldNotify(MoviePageProvider oldWidget) {
    return true;
  }
}
