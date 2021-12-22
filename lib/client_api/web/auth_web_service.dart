import 'package:moovee_land/client_api/web/api_web_config.dart';

class AuthWebService {
  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _authToken();
    final validToken = await _validateToken(
        username: username, password: password, token: token);
    final sessionId = await _createSession(token: validToken);
    return sessionId;
  }

  Future<String> _authToken() async {
    final token = await ApiWebUtils.get<String>(
      path: 'authentication/token/new',
      parser: (dynamic response) => response['request_token'] as String,
    );
    return token;
  }

  Future<String> _validateToken({
    required String username,
    required String password,
    required String token,
  }) async {
    final Map<String, String> parameters = {
      'username': username,
      'password': password,
      'request_token': token,
    };
    final validToken = await ApiWebUtils.post<String>(
      path: 'authentication/token/validate_with_login',
      parser: (dynamic response) => response['request_token'] as String,
      bodyParameters: parameters,
    );
    return validToken;
  }

  Future<String> _createSession({required String token}) async {
    final Map<String, String> parameters = {'request_token': token};
    final sessionId = await ApiWebUtils.post<String>(
      path: 'authentication/session/new',
      parser: (dynamic response) => response['session_id'] as String,
      bodyParameters: parameters,
    );
    return sessionId;
  }
}
