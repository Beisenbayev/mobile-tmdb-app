import 'package:flutter/material.dart';
import 'package:moovee_land/widgets/login_form_widget.dart';
import 'package:moovee_land/theme/text_theme.dart';
import 'package:moovee_land/theme/button_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            const LoginFormWidget(),
            const SizedBox(height: 26.0),
            _LoginPageTextWidget()
          ],
        ),
      ),
    );
  }
}

class _LoginPageTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. Click here to get started.: ',
          style: TextStyleTheme.main,
        ),
        TextButton(
          style: ButtonStyleTheme.textButton,
          onPressed: () {},
          child: const Text('registration'),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'If you signed up but didn\'t get your verification email, click here to have it resent: ',
          style: TextStyleTheme.main,
        ),
        TextButton(
          style: ButtonStyleTheme.textButton,
          onPressed: () {},
          child: const Text('verification'),
        )
      ],
    );
  }
}
