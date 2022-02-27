import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/cast/cast_details.dart';
import 'package:moovee_land/client_api/services/cast_service.dart';

class CastPageModel extends ChangeNotifier {
  final _castService = CastService();
  final int _castId;
  CastDetails? _castDetails;

  CastDetails? get castDetails => _castDetails;

  CastPageModel(this._castId) {
    loadCast();
  }

  Future<void> loadCast() async {
    _castDetails = await _castService.getCastDetails(_castId);
    notifyListeners();
  }
}
