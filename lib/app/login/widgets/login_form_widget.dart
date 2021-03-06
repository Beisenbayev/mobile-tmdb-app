import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/login_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/form_theme.dart';
import 'package:moovee_land/core/theme/button_theme.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  void _handleResetPassword() {}

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginPageModel>();

    final buttonOnPressed =
        model.isSubmitting ? null : () => model.handleAuth(context);
    final buttonStyle = model.isSubmitting
        ? ButtonThemeShelf.elevatedButtonDisabled
        : ButtonThemeShelf.elevatedButton;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _InputField(
          label: 'Username',
          controller: model.loginController,
        ),
        const SizedBox(height: 16.0),
        _InputField(
          label: 'Password',
          controller: model.passwordController,
          isPassword: true,
        ),
        if (model.errorText != null) _ErrorField(text: model.errorText!),
        const SizedBox(height: 30.0),
        Row(
          children: <Widget>[
            ElevatedButton(
              style: buttonStyle,
              onPressed: buttonOnPressed,
              child: const Text('Login'),
            ),
            const SizedBox(width: 20.0),
            TextButton(
              style: ButtonThemeShelf.textButton,
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
          style: TextThemeShelf.main,
        ),
        const SizedBox(height: 5.0),
        TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: InputThemeShelf.outlined,
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
          style: TextThemeShelf.error,
        )
      ],
    );
  }
}
