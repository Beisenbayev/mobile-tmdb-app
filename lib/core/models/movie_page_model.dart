import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entity/movie_credits.dart';
import 'package:moovee_land/client_api/entity/movie_discussions.dart';
import 'package:moovee_land/client_api/entity/movie_keywords.dart';
import 'package:moovee_land/client_api/entity/movie_videos.dart';
import 'package:moovee_land/client_api/entity/movies_response.dart';
import 'package:moovee_land/client_api/movie_service.dart';
import 'package:moovee_land/client_api/entity/movie_details.dart';
import 'package:moovee_land/core/storage/session_storage.dart';

class MoviePageModel extends ChangeNotifier {
  final _sessionStorage = SessionStorage();
  final _movieService = MovieService();
  final int _movieId;
  MovieDetails? _ditails;
  MovieAccountStates? _accountStates;
  MovieCredits? _credits;
  MovieDiscussions? _discussions;
  MoviesResponse? _recommendations;
  MovieKeywords? _keywords;
  MoviesResponse? _similarMovies;
  MovieVideos? _videos;
  bool _isFavorite = false;

  int get movieId => _movieId;
  MovieDetails? get ditails => _ditails;
  MovieAccountStates? get account => _accountStates;
  MovieCredits? get credits => _credits;
  MovieDiscussions? get discussions => _discussions;
  MoviesResponse? get recommendations => _recommendations;
  MovieKeywords? get keywordsResponse => _keywords;
  MoviesResponse? get similarMovies => _similarMovies;
  MovieVideos? get videos => _videos;
  bool get isFavorite => _isFavorite;

  MoviePageModel(this._movieId) {
    _loadMovie();
  }

  void _loadMovie() async {
    final _sessionId = await _sessionStorage.getSessionId();

    _ditails = await _movieService.getMovieDetails(_movieId);
    if (_sessionId != null) {
      await _loadAccountStates(_sessionId);
    }
    _credits = await _movieService.getMovieCredits(_movieId);
    _discussions = await _movieService.getMovieDiscussions(_movieId);
    _recommendations = await _movieService.getMovieRecommendations(_movieId);
    _keywords = await _movieService.getMovieKeywords(_movieId);
    _similarMovies = await _movieService.getSimilarMovies(_movieId);
    _videos = await _movieService.getMovieVideos(_movieId);
    notifyListeners();
  }

  Future<void> _loadAccountStates(String _sessionId) async {
    _accountStates =
        await _movieService.getMovieAccountStates(_movieId, _sessionId);
    if (_accountStates == null) return;

    _isFavorite = _accountStates!.favorite;
  }

  void markMovieAsFavorite() async {
    final _accountId = await _sessionStorage.getUserId();
    final _sessionId = await _sessionStorage.getSessionId();

    if (_accountId == null || _sessionId == null) return;

    await _movieService.markMediaAsFavorite(
      accountId: _accountId,
      sessionId: _sessionId,
      mediaId: movieId,
      mediaType: MediaType.movie,
      favorite: !_isFavorite,
    );
    await _loadAccountStates(_sessionId);
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
