import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entity/show.dart';
import 'package:moovee_land/client_api/entity/shows_response.dart';
import 'package:moovee_land/client_api/home_service.dart';

class ShowsListModel extends ChangeNotifier {
  final _homeService = HomeService();
  final List<Show> _shows = [];
  int _currentPageIndex = 0;
  int _totalPageCount = 1;
  bool _isLoadingInProgress = false;
  String? _searchQuery;
  Timer? _searchTimer;

  List<Show> get shows => List.unmodifiable(_shows);

  ShowsListModel() {
    _resetSettings();
  }

  Future<void> _resetSettings() async {
    _currentPageIndex = 0;
    _totalPageCount = 1;
    _shows.clear();
    await _loadNextPage();
  }

  Future<ShowsResponse> _loadShows(int index) async {
    final String query = _searchQuery ?? '';
    if (query.isEmpty) {
      return await _homeService.getPopularShows(index);
    } else {
      return await _homeService.searchShows(index, query);
    }
  }

  Future<void> _loadNextPage() async {
    if (_isLoadingInProgress || _currentPageIndex >= _totalPageCount) return;

    _isLoadingInProgress = true;
    final nextPageIndex = _currentPageIndex + 1;

    try {
      final loadedShows = await _loadShows(nextPageIndex);
      _currentPageIndex = loadedShows.page;
      _totalPageCount = loadedShows.totalPages;
      _shows.addAll(loadedShows.shows);
      notifyListeners();
    } catch (_) {
    } finally {
      _isLoadingInProgress = false;
    }
  }

  void handleSearchShows(String text) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 600), () async {
      if (_searchQuery == text) return;
      _searchQuery = text;
      await _resetSettings();
    });
  }

  void loadShowsByIndex(int index) {
    if (index < _shows.length - 1) return;
    _loadNextPage();
  }
}

class ShowsListProvider extends InheritedNotifier {
  final ShowsListModel model;

  const ShowsListProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static ShowsListProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShowsListProvider>();
  }

  @override
  bool updateShouldNotify(ShowsListProvider oldWidget) {
    return true;
  }
}
