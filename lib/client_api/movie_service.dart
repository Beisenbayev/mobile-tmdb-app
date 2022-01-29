import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movie_credits.dart';
import 'package:moovee_land/client_api/entity/movie_details.dart';
import 'package:moovee_land/client_api/entity/movie_discussions.dart';
import 'package:moovee_land/client_api/entity/movie_keywords.dart';
import 'package:moovee_land/client_api/entity/movies_response.dart';

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
}
