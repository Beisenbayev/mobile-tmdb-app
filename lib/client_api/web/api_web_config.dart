import 'dart:convert';
import 'dart:html';

class ApiWebConfig {
  static const String apiKey = '74204da53696b8c3aa676978394bff1f';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';
}

class ApiWebUtils {
  static Future<T> get<T>({
    required String path,
    required T Function(dynamic) parser,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await HttpRequest.getString(
            '${ApiWebConfig.baseUrl}/$path?api_key=${ApiWebConfig.apiKey}')
        .then((request) => jsonDecode(request))
        .then((response) => response as Map<String, dynamic>);
    final result = parser(response);
    return result;
  }

  static Future<T> post<T>({
    required String path,
    required T Function(dynamic) parser,
    required Map<String, String> bodyParameters,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await HttpRequest.postFormData(
      '${ApiWebConfig.baseUrl}/$path?api_key=${ApiWebConfig.apiKey}',
      bodyParameters,
    )
        .then((request) => jsonDecode(request.response))
        .then((response) => response as Map<String, dynamic>);
    final result = parser(response);
    return result;
  }
}
