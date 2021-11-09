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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _InputField(
          label: 'Username',
        ),
        const SizedBox(height: 16.0),
        _InputField(
          label: 'Password',
        ),
        const SizedBox(height: 30.0),
        Row(
          children: <Widget>[
            ElevatedButton(
              style: ButtonStyleTheme.elevatedButton,
              onPressed: () {},
              child: const Text('Login'),
            ),
            const SizedBox(width: 20.0),
            TextButton(
              style: ButtonStyleTheme.textButton,
              onPressed: () {},
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

  _InputField({
    key,
    required this.label,
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
        const TextField(
          decoration: InputFieldStyleTheme.outlined,
        )
      ],
    );
  }
}
