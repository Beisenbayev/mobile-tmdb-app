import 'package:flutter/material.dart';
import 'package:moovee_land/theme/text_theme.dart';
import 'package:moovee_land/theme/form_theme.dart';
import 'package:moovee_land/theme/button_theme.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorText;

  void _handleAuth() {
    if (loginController.text == 'login' && passwordController.text == 'pass') {
      errorText = null;
    } else {
      errorText = 'Incorrect login or password!';
      print(errorText);
    }
  }

  void _handleResetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _InputField(
          label: 'Username',
          controller: loginController,
        ),
        const SizedBox(height: 16.0),
        _InputField(
          label: 'Password',
          controller: passwordController,
        ),
        const SizedBox(height: 30.0),
        Row(
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyleTheme.elevatedButton,
              onPressed: _handleAuth,
              child: const Text('Login'),
            ),
            const SizedBox(width: 20.0),
            TextButton(
              style: ButtonStyleTheme.textButton,
              onPressed: _handleResetPassword,
              child: const Text('Reset password'),
            ),
          ],
        )
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _InputField({
    key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyleTheme.main,
        ),
        const SizedBox(height: 5.0),
        TextField(
          controller: controller,
          decoration: InputFieldStyleTheme.outlined,
        )
      ],
    );
  }
}
