import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/show/show.dart';
import 'package:moovee_land/client_api/entities/show/shows_response.dart';
import 'package:moovee_land/client_api/services/home_service.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';

class ShowsListModel extends ChangeNotifier {
  final _homeService = HomeService();
  late final Paginator<Show> _showsPaginator;
  final List<Show> _shows = [];
  String? _searchQuery;
  Timer? _searchTimer;

  List<Show> get shows => List.unmodifiable(_shows);

  ShowsListModel() {
    _showsPaginator = Paginator<Show>((int index) async {
      late final ShowsResponse response;
      final String query = _searchQuery ?? '';
      if (query.isEmpty) {
        response = await _homeService.getPopularShows(index);
      } else {
        response = await _homeService.searchShows(index, query);
      }

      return PaginatorResult(
        data: response.shows,
        currentPage: response.page,
        totalPages: response.totalPages,
      );
    });
    _resetSettings();
  }

  Future<void> _loadShows() async {
    await _showsPaginator.loadNextPage();
    _shows.addAll(_showsPaginator.data);
    notifyListeners();
  }

  Future<void> _resetSettings() async {
    _showsPaginator.reset();
    _shows.clear();
    await _loadShows();
  }

  void handleSearchShows(String text) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 600), () async {
      if (_searchQuery == text) return;
      _searchQuery = text;
      await _resetSettings();
    });
  }

  void loadShowsByIndex(int index) async {
    if (index < _shows.length - 1) return;
    await _loadShows();
  }
}
