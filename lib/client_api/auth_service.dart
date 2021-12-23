import 'package:moovee_land/client_api/api_config.dart';

class AuthService {
  Future<String> auth({required username, required password}) async {
    final token = await _createToken();
    final validToken = await _validateToken(
      username: username,
      password: password,
      token: token,
    );
    final sessionId = await _createSession(token: validToken);

    return sessionId;
  }

  Future<String> _createToken() async {
    final token = await ApiUtils.get<String>(
      path: 'authentication/token/new',
      parser: (dynamic json) => json['request_token'] as String,
      queryParameters: {
        'api_key': ApiConfig.apiKey,
      },
    );
    return token;
  }

  Future<String> _validateToken({
    required username,
    required password,
    required token,
  }) async {
    final Map<String, dynamic> parameters = {
      'username': username,
      'password': password,
      'request_token': token
    };
    final validToken = await ApiUtils.post<String>(
      path: 'authentication/token/validate_with_login',
      parser: (dynamic json) => json['request_token'] as String,
      bodyParameters: parameters,
      queryParameters: {
        'api_key': ApiConfig.apiKey,
      },
    );
    return validToken;
  }

  Future<String> _createSession({required token}) async {
    final Map<String, dynamic> parameters = {'request_token': token};
    final sessionId = await ApiUtils.post<String>(
      path: 'authentication/session/new',
      parser: (dynamic json) => json['session_id'] as String,
      bodyParameters: parameters,
      queryParameters: {
        'api_key': ApiConfig.apiKey,
      },
    );
    return sessionId;
  }
}
