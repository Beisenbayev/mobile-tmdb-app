import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/popular_movies.dart';

class HomeService {
  Future<PopularMovies> getPopularMovies(int index) async {
    PopularMovies parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return PopularMovies.fromJson(jsonMap);
    }

    final popularMovies = await ApiUtils.get<PopularMovies>(
      path: 'movie/popular',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
        'page': index.toString(),
      },
    );
    return popularMovies;
  }
}
