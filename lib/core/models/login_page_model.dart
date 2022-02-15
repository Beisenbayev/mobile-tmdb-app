import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/services/auth_service.dart';
import 'package:moovee_land/core/storage/session_storage.dart';
//import 'package:moovee_land/client_api/web/auth_web_service.dart';
import 'package:moovee_land/router/routes.dart';

class LoginPageModel extends ChangeNotifier {
  final _authService = AuthService();
  final _sessionStorage = SessionStorage();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSubmitting = false;
  String? errorText;

  void handleAuth(BuildContext context) async {
    isSubmitting = true;
    errorText = null;
    notifyListeners();

    final login = loginController.text;
    final password = passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      errorText = 'Fields cannot be empty!';
      isSubmitting = false;
      notifyListeners();
      return;
    }

    try {
      final sessionId =
          await _authService.auth(username: login, password: password);
      final userDetails = await _authService.getUserDetails(sessionId);
      await _sessionStorage.setSessionId(sessionId);
      await _sessionStorage.setUserId(userDetails.id);

      Navigator.of(context).pushReplacementNamed(RouteAliasData.home);
    } on AuthExeption catch (error) {
      switch (error.type) {
        case AuthExeptionsType.network:
          errorText = 'Network error. Please check your connection!';
          break;
        case AuthExeptionsType.auth:
          errorText = 'Incorrect login or password!';
          break;
        case AuthExeptionsType.other:
          errorText = 'Something went wrong, please try again!';
          break;
      }
    } catch (_) {
      errorText = 'Something went wrong, please try again!';
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
}
