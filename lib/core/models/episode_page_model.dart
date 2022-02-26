import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/episode/episode_details.dart';

class ShowEpisodeData {
  final int showId;
  final int seasonNumber;
  final int episodeNumber;

  ShowEpisodeData({
    required this.showId,
    required this.seasonNumber,
    required this.episodeNumber,
  });
}

class EpisodePageModel extends ChangeNotifier {
  final int _showId;
  final int _seasonNumber;
  final int _episodeNumber;
  EpisodeDetails? _details;

  EpisodePageModel(ShowEpisodeData data)
      : _showId = data.showId,
        _seasonNumber = data.seasonNumber,
        _episodeNumber = data.episodeNumber;

  EpisodeDetails? get details => _details;
}
