import 'package:moovee_land/core/storage/session_storage.dart';

class ModelService {
  static Future<void> logout() async {
    final _sessionStorage = SessionStorage();
    _sessionStorage.deleteSessionId();
    _sessionStorage.deleteUserId();
  }
}
