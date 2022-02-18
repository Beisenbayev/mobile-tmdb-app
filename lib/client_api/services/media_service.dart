import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entities/additional/post_response.dart';

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

class MediaService {
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

  Future<PostResponse> addMediaToWatchlist({
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
