import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entities/episode/episode_credits.dart';
import 'package:moovee_land/client_api/entities/episode/episode_details.dart';
import 'package:moovee_land/client_api/entities/media/media_videos.dart';

class EpisodeService {
  Future<EpisodeDetails> getEpisodeDetails(
      int showId, int seasonNumber, int episodeNumber) async {
    EpisodeDetails parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return EpisodeDetails.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<EpisodeDetails>(
      path: 'tv/$showId/season/$seasonNumber/episode/$episodeNumber',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<EpisodeCredits> getEpisodeCredits(
      int showId, int seasonNumber, int episodeNumber) async {
    EpisodeCredits parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return EpisodeCredits.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<EpisodeCredits>(
      path: 'tv/$showId/season/$seasonNumber/episode/$episodeNumber/credits',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }

  Future<MediaVideos> getEpisodeVideos(
      int showId, int seasonNumber, int episodeNumber) async {
    MediaVideos parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      return MediaVideos.fromJson(jsonMap);
    }

    final response = await ApiUtils.get<MediaVideos>(
      path: 'tv/$showId/season/$seasonNumber/episode/$episodeNumber/videos',
      parser: parser,
      queryParameters: <String, dynamic>{
        'api_key': ApiConfig.apiKey,
        'language': 'en-US',
      },
    );
    return response;
  }
}
