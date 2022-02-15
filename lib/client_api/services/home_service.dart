import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entities/movie/movies_response.dart';
import 'package:moovee_land/client_api/entities/movie/movies_response_with_date.dart';
import 'package:moovee_land/client_api/entities/show/shows_response.dart';

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

  Future<ShowsResponse> getPopularShows(int index) async {
    ShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowsResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowsResponse>(
      path: 'tv/popular',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<ShowsResponse> getTopRatedShows(int index) async {
    ShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowsResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowsResponse>(
      path: 'tv/top_rated',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<ShowsResponse> getOnTheAirShows(int index) async {
    ShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowsResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowsResponse>(
      path: 'tv/on_the_air',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<ShowsResponse> getAiringTodayShows(int index) async {
    ShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowsResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowsResponse>(
      path: 'tv/airing_today',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return response;
  }

  Future<ShowsResponse> searchShows(int index, String query) async {
    ShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowsResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowsResponse>(
      path: 'search/tv',
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
