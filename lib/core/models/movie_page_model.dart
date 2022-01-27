import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entity/movie_credits.dart';
import 'package:moovee_land/client_api/movie_service.dart';
import 'package:moovee_land/client_api/entity/movie_details.dart';

class MoviePageModel extends ChangeNotifier {
  final _movieService = MovieService();
  final int _movieId;
  MovieDetails? _ditails;
  MovieCredits? _credits;

  int get movieId => _movieId;
  MovieDetails? get ditails => _ditails;
  MovieCredits? get credits => _credits;

  MoviePageModel(this._movieId) {
    _loadMovie();
  }

  void _loadMovie() async {
    _ditails = await _movieService.getMovieDetails(_movieId);
    _credits = await _movieService.getMovieCredits(_movieId);
    notifyListeners();
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
