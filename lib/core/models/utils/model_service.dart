import 'package:flutter/material.dart';
import 'package:moovee_land/core/storage/session_storage.dart';
import 'package:moovee_land/router/navigation_controller.dart';

class ModelService {
  static Future<bool> checkAuth() async {
    final _sessionStorage = SessionStorage();
    final _sessionId = await _sessionStorage.getSessionId();
    final _userId = await _sessionStorage.getUserId();
    return (_sessionId != null && _userId != null);
  }

  static Future<void> logout(BuildContext context) async {
    final _sessionStorage = SessionStorage();
    _sessionStorage.deleteSessionId();
    _sessionStorage.deleteUserId();
    NavigationController.goToIntroPage(context);
  }
}
