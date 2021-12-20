import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/auth_service.dart';
//import 'package:moovee_land/client_api/web/auth_web_service.dart';
import 'package:moovee_land/router/routes.dart';

class LoginPageModel extends ChangeNotifier {
  final _authService = AuthService();
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
      await _authService.auth(username: login, password: password);
      Navigator.of(context).pushReplacementNamed(RouteAliasData.home);
    } catch (error) {
      print(error);
      errorText = 'Incorrect login or password!';
      notifyListeners();
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
}

class LoginPageProvider extends InheritedNotifier {
  final LoginPageModel model;

  const LoginPageProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static LoginPageProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginPageProvider>();
  }

  @override
  bool updateShouldNotify(LoginPageProvider oldWidget) {
    return true;
  }
}
