import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/season/season_details.dart';
import 'package:moovee_land/client_api/entities/show/show_details.dart';
import 'package:moovee_land/client_api/services/show_service.dart';

class ShowSeasonData {
  final int showId;
  final int seasonNumber;

  ShowSeasonData({
    required this.showId,
    required this.seasonNumber,
  });
}

class SeasonPageModel extends ChangeNotifier {
  final _showService = ShowService();
  final int _showId;
  final int _seasonNumber;
  ShowDetails? _showDetails;
  SeasonDetails? _seasonDetails;

  ShowDetails? get showDetails => _showDetails;
  SeasonDetails? get seasonDetails => _seasonDetails;

  SeasonPageModel(ShowSeasonData data)
      : _showId = data.showId,
        _seasonNumber = data.seasonNumber {
    _loadSeason();
  }

  void _loadSeason() async {
    _showDetails = await _showService.getShowDetails(_showId);
    _seasonDetails =
        await _showService.getShowSeasonDetails(_showId, _seasonNumber);
    notifyListeners();
  }
}
