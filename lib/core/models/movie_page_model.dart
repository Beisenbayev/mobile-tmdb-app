import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/movie_service.dart';
import 'package:moovee_land/client_api/entity/movie_details.dart';

class MoviePageModel extends ChangeNotifier {
  final _movieService = MovieService();
  late final MovieDetails _movieDitails;
  late final int _movieId;

  int get movieId => _movieId;
  MovieDetails get movieDitails => _movieDitails;

  MoviePageModel(this._movieId) {
    _loadMovie();
  }

  void _loadMovie() async {
    _movieDitails = await _movieService.getMovieDetails(_movieId);
    print(_movieDitails.adult);
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
