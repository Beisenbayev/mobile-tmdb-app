import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entities/additional/post_response.dart';
import 'package:moovee_land/client_api/entities/movie/movie_credits.dart';
import 'package:moovee_land/client_api/entities/movie/movie_details.dart';
import 'package:moovee_land/client_api/entities/movie/movie_discussions.dart';
import 'package:moovee_land/client_api/entities/movie/movie_keywords.dart';
import 'package:moovee_land/client_api/entities/movie/movie_videos.dart';
import 'package:moovee_land/client_api/entities/movie/movies_response.dart';

enum MediaType { movie, tv }

extension MediaTypeAsString on MediaType {
  asString() {
    switch (this) {
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
    }
  }
}

class MovieService {
  Future<MovieDetails> getMovieDetails(int movieId) async {
    MovieDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MovieDetails.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MovieDetails>(
      path: 'movie/$movieId',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MovieAccountStates> getMovieAccountStates(
      int movieId, String sessionId) async {
    MovieAccountStates parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MovieAccountStates.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MovieAccountStates>(
      path: 'movie/$movieId/account_states',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'session_id': sessionId,
      },
    );
    return response;
  }

  Future<MovieCredits> getMovieCredits(int movieId) async {
    MovieCredits parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MovieCredits.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MovieCredits>(
      path: 'movie/$movieId/credits',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MovieDiscussions> getMovieDiscussions(int movieId) async {
    MovieDiscussions parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MovieDiscussions.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MovieDiscussions>(
      path: 'movie/$movieId/reviews',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MoviesResponse> getMovieRecommendations(int movieId) async {
    MoviesResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MoviesResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MoviesResponse>(
      path: 'movie/$movieId/recommendations',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MovieKeywords> getMovieKeywords(int movieId) async {
    MovieKeywords parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MovieKeywords.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MovieKeywords>(
      path: 'movie/$movieId/keywords',
      parser: parser,
      queryParameters: ApiDefaults.defaultQueryParameters,
    );
    return response;
  }

  Future<MoviesResponse> getSimilarMovies(int movieId) async {
    MoviesResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MoviesResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MoviesResponse>(
      path: 'movie/$movieId/similar',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MovieVideos> getMovieVideos(int movieId) async {
    MovieVideos parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MovieVideos.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MovieVideos>(
      path: 'movie/$movieId/videos',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<PostResponse> markMediaAsFavorite({
    required int accountId,
    required String sessionId,
    required int mediaId,
    required MediaType mediaType,
    required bool favorite,
  }) async {
    PostResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return PostResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.post<PostResponse>(
      path: '/account/$accountId/favorite',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'session_id': sessionId,
      },
      bodyParameters: <String, dynamic>{
        'media_type': mediaType.asString(),
        'media_id': mediaId,
        'favorite': favorite,
      },
    );
    return response;
  }

  Future<PostResponse> addMovieToWatchlist({
    required int accountId,
    required String sessionId,
    required int mediaId,
    required MediaType mediaType,
    required bool isInWatchlist,
  }) async {
    PostResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return PostResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.post<PostResponse>(
      path: '/account/$accountId/watchlist',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'session_id': sessionId,
      },
      bodyParameters: <String, dynamic>{
        'media_type': mediaType.asString(),
        'media_id': mediaId,
        'watchlist': isInWatchlist,
      },
    );
    return response;
  }
}
