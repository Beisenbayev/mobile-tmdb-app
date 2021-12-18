import 'dart:convert';
import 'dart:html';

import 'package:moovee_land/client_api/web/api_web_config.dart';

class AuthWebApi {
  Future<String> auth({
    required String username,
    required String password,
    required String token,
  }) async {
    final token = await _authToken();
    final validToken = await _validateToken(
        username: username, password: password, token: token);
    final sessionId = await _createSession(token: validToken);
    return sessionId;
  }

  Future<String> _authToken() async {
    final response = await HttpRequest.getString(
            '${ApiWebConfig.baseUrl}/authentication/token/new?api_key=${ApiWebConfig.apiKey}')
        .then((request) => jsonDecode(request))
        .then((response) => response as Map<String, dynamic>);
    final token = response['request_token'] as String;
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
    final response = await HttpRequest.postFormData(
      '${ApiWebConfig.baseUrl}/authentication/token/validate_with_login?api_key=${ApiWebConfig.apiKey}',
      parameters,
    )
        .then((request) => jsonDecode(request.response))
        .then((response) => response as Map<String, dynamic>);
    final validToken = response['request_token'] as String;
    return validToken;
  }

  Future<String> _createSession({required String token}) async {
    final Map<String, String> parameters = {'request_token': token};
    final response = await HttpRequest.postFormData(
      '${ApiWebConfig.baseUrl}/authentication/session/new?api_key=${ApiWebConfig.apiKey}',
      parameters,
    )
        .then((request) => jsonDecode(request.response))
        .then((response) => response as Map<String, dynamic>);
    final sessionId = response['session_id'] as String;
    return sessionId;
  }
}
