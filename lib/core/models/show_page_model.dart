import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/media/media_discussions.dart';
import 'package:moovee_land/client_api/entities/media/media_keywords.dart';
import 'package:moovee_land/client_api/entities/media/media_videos.dart';
import 'package:moovee_land/client_api/entities/show/show_aggregate_credits.dart';
import 'package:moovee_land/client_api/entities/show/show_details.dart';
import 'package:moovee_land/client_api/entities/show/shows_response.dart';
import 'package:moovee_land/client_api/services/media_service.dart';
import 'package:moovee_land/client_api/services/show_service.dart';
import 'package:moovee_land/core/storage/session_storage.dart';

class ShowPageModel extends ChangeNotifier {
  final _sessionStorage = SessionStorage();
  final _showService = ShowService();
  final _mediaService = MediaService();
  final int _showId;
  ShowDetails? _details;
  ShowAccountStates? _accountStates;
  ShowAggregateCredits? _credits;
  MediaDiscussions? _discussions;
  ShowsResponse? _recommendations;
  ShowKeywords? _keywords;
  ShowsResponse? _similarShows;
  MediaVideos? _videos;
  bool _isFavorite = false;
  bool _isInWatchlist = false;

  int get showId => _showId;
  ShowDetails? get details => _details;
  ShowAccountStates? get account => _accountStates;
  ShowAggregateCredits? get credits => _credits;
  MediaDiscussions? get discussions => _discussions;
  ShowsResponse? get recommendations => _recommendations;
  ShowKeywords? get keywordsResponse => _keywords;
  ShowsResponse? get similarShows => _similarShows;
  MediaVideos? get videos => _videos;
  bool get isFavorite => _isFavorite;
  bool get isInWatchlist => _isInWatchlist;

  ShowPageModel(this._showId) {
    _loadShow();
  }

  void _loadShow() async {
    final _sessionId = await _sessionStorage.getSessionId();

    _details = await _showService.getShowDetails(_showId);
    if (_sessionId != null) {
      await _loadAccountStates(_sessionId);
    }
    _credits = await _showService.getShowCredits(_showId);
    _discussions = await _showService.getShowDiscussions(_showId);
    _recommendations = await _showService.getShowsRecommendations(_showId);
    _keywords = await _showService.getShowKeywords(_showId);
    _similarShows = await _showService.getSimilarShows(_showId);
    _videos = await _showService.getShowVideos(_showId);
    notifyListeners();
  }

  Future<void> _loadAccountStates(String _sessionId) async {
    _accountStates =
        await _showService.getShowAccountStates(_showId, _sessionId);
    if (_accountStates == null) return;

    _isFavorite = _accountStates!.favorite;
    _isInWatchlist = _accountStates!.watchlist;
  }

  void markShowAsFavorite() async {
    final _accountId = await _sessionStorage.getUserId();
    final _sessionId = await _sessionStorage.getSessionId();

    if (_accountId == null || _sessionId == null) return;

    await _mediaService.markMediaAsFavorite(
      accountId: _accountId,
      sessionId: _sessionId,
      mediaId: showId,
      mediaType: MediaType.tv,
      favorite: !_isFavorite,
    );
    await _loadAccountStates(_sessionId);
    notifyListeners();
  }

  void addShowToWatchlist() async {
    final _accountId = await _sessionStorage.getUserId();
    final _sessionId = await _sessionStorage.getSessionId();

    if (_accountId == null || _sessionId == null) return;

    await _mediaService.addMediaToWatchlist(
      accountId: _accountId,
      sessionId: _sessionId,
      mediaId: showId,
      mediaType: MediaType.tv,
      isInWatchlist: !_isInWatchlist,
    );
    await _loadAccountStates(_sessionId);
    notifyListeners();
  }
}
