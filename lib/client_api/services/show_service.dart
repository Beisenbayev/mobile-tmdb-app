import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entities/media/media_credits.dart';
import 'package:moovee_land/client_api/entities/media/media_discussions.dart';
import 'package:moovee_land/client_api/entities/media/media_keywords.dart';
import 'package:moovee_land/client_api/entities/media/media_videos.dart';
import 'package:moovee_land/client_api/entities/show/show_details.dart';
import 'package:moovee_land/client_api/entities/show/shows_response.dart';

class ShowService {
  Future<ShowDetails> getShowDetails(int showId) async {
    ShowDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowDetails.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowDetails>(
      path: 'tv/$showId',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<ShowAccountStates> getShowAccountStates(
      int showId, String sessionId) async {
    ShowAccountStates parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowAccountStates.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowAccountStates>(
      path: 'tv/$showId/account_states',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'session_id': sessionId,
      },
    );
    return response;
  }

  Future<MediaCredits> getShowCredits(int showId) async {
    MediaCredits parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MediaCredits.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MediaCredits>(
      path: 'tv/$showId/credits',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MediaDiscussions> getShowDiscussions(int showId) async {
    MediaDiscussions parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MediaDiscussions.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MediaDiscussions>(
      path: 'tv/$showId/reviews',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<ShowsResponse> getShowsRecommendations(int showId) async {
    ShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowsResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowsResponse>(
      path: 'tv/$showId/recommendations',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MediaKeywords> getShowKeywords(int showId) async {
    MediaKeywords parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MediaKeywords.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MediaKeywords>(
      path: 'tv/$showId/keywords',
      parser: parser,
      queryParameters: ApiDefaults.defaultQueryParameters,
    );
    return response;
  }

  Future<ShowsResponse> getSimilarShows(int showId) async {
    ShowsResponse parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return ShowsResponse.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<ShowsResponse>(
      path: 'tv/$showId/similar',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MediaVideos> getShowVideos(int showId) async {
    MediaVideos parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MediaVideos.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MediaVideos>(
      path: 'tv/$showId/videos',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }
}
