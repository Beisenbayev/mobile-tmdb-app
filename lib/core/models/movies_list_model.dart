import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movie.dart';
import 'package:moovee_land/client_api/home_service.dart';

class MoviesListModel extends ChangeNotifier {
  final _homeService = HomeService();
  final _timeFormat = DateFormat.yMMMMd().format;
  final List<Movie> _movies = [];
  int _currentPageIndex = 0;
  int _totalPageCount = 1;
  bool _isLoadingInProgress = false;

  List<Movie> get movies => List.unmodifiable(_movies);

  MoviesListModel() {
    _movies.clear();
    handleLoadMovies();
  }

  void handleLoadMovies() async {
    if (_isLoadingInProgress || _currentPageIndex >= _totalPageCount) return;

    _isLoadingInProgress = true;
    final nextPageIndex = _currentPageIndex + 1;

    try {
      final loadedMovies = await _homeService.getPopularMovies(nextPageIndex);
      _currentPageIndex = loadedMovies.page;
      _totalPageCount = loadedMovies.totalPages;
      _movies.addAll(loadedMovies.movies);
      notifyListeners();
    } catch (_) {
    } finally {
      _isLoadingInProgress = false;
    }
  }

  void loadMoviesByIndex(int index) {
    if (index < movies.length - 1) return;
    handleLoadMovies();
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
