import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class _Keys {
  static const String sessionId = 'session_id';
  static const String accountId = 'account_id';
}

class SessionStorage {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);
  Future<void> setSessionId(String value) async {
    await _secureStorage.write(key: _Keys.sessionId, value: value);
  }

  Future<void> deleteSessionId() async {
    await _secureStorage.delete(key: _Keys.sessionId);
  }

  Future<int?> getUserId() async {
    final id = await _secureStorage.read(key: _Keys.accountId);
    return (id != null) ? int.tryParse(id) : null;
  }

  Future<void> setUserId(int value) async {
    await _secureStorage.write(key: _Keys.accountId, value: value.toString());
  }

  Future<void> deleteUserId() async {
    await _secureStorage.delete(key: _Keys.accountId);
  }
}
