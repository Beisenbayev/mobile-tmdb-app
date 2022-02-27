import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/episode/episode_credits.dart';
import 'package:moovee_land/client_api/entities/episode/episode_details.dart';
import 'package:moovee_land/client_api/entities/show/show_details.dart';
import 'package:moovee_land/client_api/services/show_service.dart';

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
  final _showService = ShowService();
  final int _showId;
  final int _seasonNumber;
  final int _episodeNumber;
  ShowDetails? _showDetails;
  EpisodeDetails? _episodeDetails;
  EpisodeCredits? _episodeCredits;

  ShowDetails? get showDetails => _showDetails;
  EpisodeDetails? get episodeDetails => _episodeDetails;
  EpisodeCredits? get episodeCredits => _episodeCredits;

  EpisodePageModel(ShowEpisodeData data)
      : _showId = data.showId,
        _seasonNumber = data.seasonNumber,
        _episodeNumber = data.episodeNumber {
    _loadEpisode();
  }

  Future<void> _loadEpisode() async {
    _showDetails = await _showService.getShowDetails(_showId);
    _episodeDetails = await _showService.getShowEpisodeDetails(
        _showId, _seasonNumber, _episodeNumber);
    _episodeCredits = await _showService.getEpisodeCredits(
        _showId, _seasonNumber, _episodeNumber);
    notifyListeners();
  }
}
