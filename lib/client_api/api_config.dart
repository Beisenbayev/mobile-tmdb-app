import 'dart:convert';
import 'dart:io';

class ApiConfig {
  static final client = HttpClient();
  static const String apiKey = '74204da53696b8c3aa676978394bff1f';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';
}

enum ApiExeptionsType { invalidApiKey, badRequest }

class ApiExeption implements Exception {
  final ApiExeptionsType type;

  const ApiExeption(this.type);
}

class ApiUtils {
  static Uri _createURI(String path, [Map<String, dynamic>? query]) {
    final Uri url = Uri.parse('${ApiConfig.baseUrl}/$path');
    if (query != null) return url.replace(queryParameters: query);
    return url;
  }

  static Future<dynamic> _getRequestJson(HttpClientRequest request) async {
    final response = await request.close();
    if (response.statusCode == 401) {
      throw const ApiExeption(ApiExeptionsType.invalidApiKey);
    } else if (response.statusCode == 404) {
      throw const ApiExeption(ApiExeptionsType.badRequest);
    }

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => jsonDecode(value));
    return json;
  }

  static Future<T> get<T>({
    required String path,
    required T Function(dynamic request) parser,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _createURI(path, queryParameters);
    final request = await ApiConfig.client.getUrl(uri);

    final json = await _getRequestJson(request) as Map<String, dynamic>;
    final response = parser(json);

    return response;
  }

  static Future<T> post<T>({
    required String path,
    required T Function(dynamic response) parser,
    required Map<String, dynamic> bodyParameters,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = _createURI(path, queryParameters);
    final request = await ApiConfig.client.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(bodyParameters));

    final json = await _getRequestJson(request) as Map<String, dynamic>;
    final response = parser(json);

    return response;
  }

  static String getImageUrl(String path) => ApiConfig.imageUrl + path;
}

class ApiDefaults {
  static const Map<String, dynamic> defaultQueryParameters = {
    'api_key': ApiConfig.apiKey,
  };
}
