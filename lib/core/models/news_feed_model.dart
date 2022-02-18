import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/movie/movie.dart';
import 'package:moovee_land/client_api/entities/show/show.dart';
import 'package:moovee_land/client_api/services/home_service.dart';
import 'package:moovee_land/router/navigation_controller.dart';

class NewsFeedModel extends ChangeNotifier {
  final _homeService = HomeService();

  final List<String> _moviesTypes =
      List.unmodifiable(['Top Rated', 'Popular', 'Now Paying', 'Upcoming']);
  final List<String> _showsTypes =
      List.unmodifiable(['Top Rated', 'Popular', 'On The Air', 'Airing Today']);
  final List<String> _trandingTypes = List.unmodifiable(['Today', 'Week']);

  final List<Movie> _movies = [];
  final List<Show> _shows = [];
  final List<Movie> _tranding = [];

  List<Movie> get movies => List.unmodifiable(_movies);
  List<Show> get shows => List.unmodifiable(_shows);
  List<Movie> get tranding => List.unmodifiable(_tranding);

  List<String> get moviesTypes => _moviesTypes;
  List<String> get showsTypes => _showsTypes;
  List<String> get trandingTypes => _trandingTypes;

  NewsFeedModel() {
    handleChangeMoviesType('Top Rated');
    handleChangeShowsType('Top Rated');
  }

  Future<List<Movie>> _loadMovies(String type) async {
    List<Movie> movies = [];
    switch (type) {
      case 'Top Rated':
        movies = (await _homeService.getTopRatedMovies(1)).movies;
        break;
      case 'Popular':
        movies = (await _homeService.getPopularMovies(1)).movies;
        break;
      case 'Now Paying':
        movies = (await _homeService.getNowPlayingMovies(1)).movies;
        break;
      case 'Upcoming':
        movies = (await _homeService.getUpcomingMovies(1)).movies;
        break;
      default:
        movies = [];
        break;
    }

    return movies;
  }

  Future<List<Show>> _loadShows(String type) async {
    List<Show> shows = [];
    switch (type) {
      case 'Top Rated':
        shows = (await _homeService.getTopRatedShows(1)).shows;
        break;
      case 'Popular':
        shows = (await _homeService.getPopularShows(1)).shows;
        break;
      case 'On The Air':
        shows = (await _homeService.getOnTheAirShows(1)).shows;
        break;
      case 'Airing Today':
        shows = (await _homeService.getAiringTodayShows(1)).shows;
        break;
      default:
        shows = [];
        break;
    }

    return shows;
  }

  void handleChangeMoviesType(String type) async {
    _movies.clear();
    final moviesByType = await _loadMovies(type);
    _movies.addAll(moviesByType);
    notifyListeners();
  }

  void handleChangeShowsType(String type) async {
    _shows.clear();
    final showsByType = await _loadShows(type);
    _shows.addAll(showsByType);
    notifyListeners();
  }
}
