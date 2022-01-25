import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movies_response.dart';
import 'package:moovee_land/client_api/entity/movies_response_with_date.dart';

class HomeService {
  Future<MoviesResponse> getPopularMovies(int index) async {
    MoviesResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MoviesResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MoviesResponse>(
      path: 'movie/popular',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<MoviesResponse> getTopRatedMovies(int index) async {
    MoviesResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MoviesResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MoviesResponse>(
      path: 'movie/top_rated',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<MoviesResponseWithDate> getNowPlayingMovies(int index) async {
    MoviesResponseWithDate parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MoviesResponseWithDate.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MoviesResponseWithDate>(
      path: 'movie/now_playing',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<MoviesResponseWithDate> getUpcomingMovies(int index) async {
    MoviesResponseWithDate parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MoviesResponseWithDate.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MoviesResponseWithDate>(
      path: 'movie/upcoming',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<MoviesResponse> searchMovies(int index, String query) async {
    MoviesResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MoviesResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MoviesResponse>(
      path: 'search/movie',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
        'query': query,
        'include_adult': true.toString(),
      },
    );
    return response;
  }
}
