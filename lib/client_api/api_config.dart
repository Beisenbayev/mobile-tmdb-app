import 'dart:convert';
import 'dart:io';

class ApiConfig {
  static final client = HttpClient();
  static const String apiKey = '74204da53696b8c3aa676978394bff1f';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageUrl = 'https://image.tmdb.org/t/p/w500';
}

class ApiUtils {
  static Uri createURI(String path, [Map<String, dynamic>? query]) {
    return Uri(
      host: ApiConfig.baseUrl,
      path: path,
      queryParameters: query,
    );
  }

  static Future<dynamic> getRequestJson(HttpClientRequest request) async {
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => jsonDecode(value));
    return json;
  }
}
