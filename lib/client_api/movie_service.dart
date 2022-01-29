import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movie_credits.dart';
import 'package:moovee_land/client_api/entity/movie_details.dart';
import 'package:moovee_land/client_api/entity/movie_discussions.dart';

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
}
