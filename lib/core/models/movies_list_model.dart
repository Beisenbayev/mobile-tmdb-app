import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/movie/movie.dart';
import 'package:moovee_land/client_api/entities/movie/movies_response.dart';
import 'package:moovee_land/client_api/services/home_service.dart';

class MoviesListModel extends ChangeNotifier {
  final _homeService = HomeService();
  final List<Movie> _movies = [];
  int _currentPageIndex = 0;
  int _totalPageCount = 1;
  bool _isLoadingInProgress = false;
  String? _searchQuery;
  Timer? _searchTimer;

  List<Movie> get movies => List.unmodifiable(_movies);

  MoviesListModel() {
    _resetSettings();
  }

  Future<void> _resetSettings() async {
    _currentPageIndex = 0;
    _totalPageCount = 1;
    _movies.clear();
    await _loadNextPage();
  }

  Future<MoviesResponse> _loadMovies(int index) async {
    final String query = _searchQuery ?? '';
    if (query.isEmpty) {
      return await _homeService.getPopularMovies(index);
    } else {
      return await _homeService.searchMovies(index, query);
    }
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPageIndex >= _totalPageCount) return;

    _isLoadingInProgress = true;
    final nextPageIndex = _currentPageIndex + 1;

    try {
      final loadedMovies = await _loadMovies(nextPageIndex);
      _currentPageIndex = loadedMovies.page;
      _totalPageCount = loadedMovies.totalPages;
      _movies.addAll(loadedMovies.movies);
      notifyListeners();
    } catch (_) {
    } finally {
      _isLoadingInProgress = false;
    }
  }

  void handleSearchMovies(String text) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 600), () async {
      if (_searchQuery == text) return;
      _searchQuery = text;
      await _resetSettings();
    });
  }

  void loadMoviesByIndex(int index) {
    if (index < movies.length - 1) return;
    _loadNextPage();
  }
}
