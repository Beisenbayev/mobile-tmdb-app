import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/show/show_details.dart';
import 'package:moovee_land/client_api/services/show_service.dart';
import 'package:moovee_land/core/storage/session_storage.dart';

class ShowPageModel extends ChangeNotifier {
  final _sessionStorage = SessionStorage();
  final _showService = ShowService();
  final int _showId;
  ShowDetails? _ditails;
  ShowAccountStates? _accountStates;
  // MovieCredits? _credits;
  // MovieDiscussions? _discussions;
  // MoviesResponse? _recommendations;
  // MovieKeywords? _keywords;
  // MoviesResponse? _similarShows;
  // MovieVideos? _videos;
  bool _isFavorite = false;
  bool _isInWatchlist = false;

  int get showId => _showId;
  ShowDetails? get ditails => _ditails;
  ShowAccountStates? get account => _accountStates;
  // MovieCredits? get credits => _credits;
  // MovieDiscussions? get discussions => _discussions;
  // MoviesResponse? get recommendations => _recommendations;
  // MovieKeywords? get keywordsResponse => _keywords;
  // MoviesResponse? get similarShows => _similarShows;
  // MovieVideos? get videos => _videos;
  bool get isFavorite => _isFavorite;
  bool get isInWatchlist => _isInWatchlist;

  ShowPageModel(this._showId) {
    _loadShow();
  }

  void _loadShow() async {
    final _sessionId = await _sessionStorage.getSessionId();

    _ditails = await _showService.getShowDetails(_showId);
    if (_sessionId != null) {
      await _loadAccountStates(_sessionId);
    }
    // _credits = await _showService.getMovieCredits(_showId);
    // _discussions = await _showService.getMovieDiscussions(_showId);
    // _recommendations = await _showService.getMovieRecommendations(_showId);
    // _keywords = await _showService.getMovieKeywords(_showId);
    // _similarMovies = await _showService.getSimilarMovies(_showId);
    // _videos = await _showService.getMovieVideos(_showId);
    notifyListeners();
  }

  Future<void> _loadAccountStates(String _sessionId) async {
    _accountStates =
        await _showService.getShowAccountStates(_showId, _sessionId);
    if (_accountStates == null) return;

    _isFavorite = _accountStates!.favorite;
    _isInWatchlist = _accountStates!.watchlist;
  }

  void markMovieAsFavorite() async {
    final _accountId = await _sessionStorage.getUserId();
    final _sessionId = await _sessionStorage.getSessionId();

    if (_accountId == null || _sessionId == null) return;

    await _showService.markShowAsFavorite(
      accountId: _accountId,
      sessionId: _sessionId,
      showId: showId,
      mediaType: MediaType.tv,
      favorite: !_isFavorite,
    );
    await _loadAccountStates(_sessionId);
    notifyListeners();
  }

  void addMovieToWatchlist() async {
    final _accountId = await _sessionStorage.getUserId();
    final _sessionId = await _sessionStorage.getSessionId();

    if (_accountId == null || _sessionId == null) return;

    await _showService.addShowToWatchlist(
      accountId: _accountId,
      sessionId: _sessionId,
      showId: showId,
      mediaType: MediaType.tv,
      isInWatchlist: !_isInWatchlist,
    );
    await _loadAccountStates(_sessionId);
    notifyListeners();
  }
}
