import 'package:flutter/material.dart';

class LoginPageModel extends ChangeNotifier {
  
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
