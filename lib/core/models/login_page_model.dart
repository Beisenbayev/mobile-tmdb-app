import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/web/auth_web_service.dart';

class LoginPageModel extends ChangeNotifier {
  final _authService = AuthWebService();
  final loginController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool isSubmitting = false;
  String? errorText;

  void handleLogin(BuildContext context) {
    errorText = null;
    final login = loginController.text;
    final password = passwordController.text;

    if (login == '' || password == '') {
      errorText = 'Fields cannot be empty!';
      notifyListeners();
      return;
    }

    try {
      _authService.auth(username: login, password: password);
      Navigator.of(context).pushReplacementNamed('home');
    } catch (error) {
      errorText = 'Incorrect login or password!';
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
