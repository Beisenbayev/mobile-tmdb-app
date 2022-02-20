import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/season/season_details.dart';
import 'package:moovee_land/client_api/services/show_service.dart';

class ShowEpisodeData {
  final int showId;
  final int seasonNumber;

  ShowEpisodeData({
    required this.showId,
    required this.seasonNumber,
  });
}

class ShowEpisodesModel extends ChangeNotifier {
  final _showService = ShowService();
  final int _showId;
  final int _seasonNumber;
  SeasonDetails? _details;

  SeasonDetails? get details => _details;

  ShowEpisodesModel(ShowEpisodeData data)
      : _showId = data.showId,
        _seasonNumber = data.seasonNumber {
    _loadEpisodes();
  }

  void _loadEpisodes() async {
    _details = await _showService.getShowSeasonDetails(_showId, _seasonNumber);
    notifyListeners();
  }
}
