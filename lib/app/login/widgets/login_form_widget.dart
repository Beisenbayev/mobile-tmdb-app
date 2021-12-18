import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/form_theme.dart';
import 'package:moovee_land/core/theme/button_theme.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final loginController = TextEditingController(text: 'login');
  final passwordController = TextEditingController(text: 'pass');
  String? errorText;

  void _handleAuth() {
    setState(() {
      if (loginController.text == 'login' &&
          passwordController.text == 'pass') {
        errorText = null;
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        errorText = 'Incorrect login or password!';
      }
    });
  }

  void _handleResetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _InputField(
          label: 'Username',
          controller: loginController,
        ),
        const SizedBox(height: 16.0),
        _InputField(
          label: 'Password',
          controller: passwordController,
          isPassword: true,
        ),
        if (errorText != null) _ErrorField(text: errorText!),
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
  final bool isPassword;

  const _InputField({
    key,
    required this.label,
    required this.controller,
    this.isPassword = false,
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
          obscureText: isPassword,
          controller: controller,
          decoration: InputFieldStyleTheme.outlined,
        )
      ],
    );
  }
}

class _ErrorField extends StatelessWidget {
  final String text;

  const _ErrorField({key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyleTheme.error,
        )
      ],
    );
  }
}
