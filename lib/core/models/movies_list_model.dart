import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/movie/movie.dart';
import 'package:moovee_land/client_api/entities/movie/movies_response.dart';
import 'package:moovee_land/client_api/services/home_service.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';

class MoviesListModel extends ChangeNotifier {
  final _homeService = HomeService();
  late final Paginator<Movie> _moviesPaginator;
  final List<Movie> _movies = [];
  String? _searchQuery;
  Timer? _searchTimer;

  List<Movie> get movies => List.unmodifiable(_movies);

  MoviesListModel() {
    _moviesPaginator = Paginator<Movie>((int index) async {
      late final MoviesResponse response;
      final String query = _searchQuery ?? '';
      if (query.isEmpty) {
        response = await _homeService.getPopularMovies(index);
      } else {
        response = await _homeService.searchMovies(index, query);
      }

      return PaginatorResult(
        data: response.movies,
        currentPage: response.page,
        totalPages: response.totalPages,
      );
    });
    _resetSettings();
  }

  Future<void> _loadMovies() async {
    await _moviesPaginator.loadNextPage();
    _movies.addAll(_moviesPaginator.data);
    notifyListeners();
  }

  Future<void> _resetSettings() async {
    _moviesPaginator.reset();
    _movies.clear();
    await _loadMovies();
  }

  void handleSearchMovies(String text) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 600), () async {
      if (_searchQuery == text) return;
      _searchQuery = text;
      await _resetSettings();
    });
  }

  void loadMoviesByIndex(int index) async {
    if (index < movies.length - 1) return;
    await _loadMovies();
  }
}
