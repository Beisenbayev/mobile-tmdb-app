import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movies_response.dart';

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
