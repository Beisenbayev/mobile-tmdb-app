import 'dart:convert';
import 'dart:io';

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
    final uri = ApiUtils.createURI('authentication/token/new', {
      'api_key': ApiConfig.apiKey,
    });
    final request = await ApiConfig.client.getUrl(uri);
    final json =
        (await ApiUtils.getRequestJson(request)) as Map<String, dynamic>;
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _validateToken({
    required username,
    required password,
    required token,
  }) async {
    final uri =
        ApiUtils.createURI('authentication/token/validate_with_login', {
      'api_key': ApiConfig.apiKey,
    });
    final request = await ApiConfig.client.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(<String, dynamic>{
      'username': username,
      'password': password,
      'request_token': token
    }));
    final json =
        (await ApiUtils.getRequestJson(request)) as Map<String, dynamic>;
    final validToken = json['request_token'] as String;
    return validToken;
  }

  Future<String> _createSession({required token}) async {
    final uri = ApiUtils.createURI('authentication/session/new', {
      'api_key': ApiConfig.apiKey,
    });
    final request = await ApiConfig.client.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(<String, dynamic>{'request_token': token}));
    final json =
        (await ApiUtils.getRequestJson(request)) as Map<String, dynamic>;
    final sessionId = json['session_id'] as String;
    return sessionId;
  }
}
