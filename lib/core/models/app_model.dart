import 'package:flutter/material.dart';
import 'package:moovee_land/core/storage/session_storage.dart';

class AppModel {
  bool _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final _sessionStorage = SessionStorage();
    final _sessionId = await _sessionStorage.getSessionId();
    _isAuth = _sessionId != null;
  }
}
