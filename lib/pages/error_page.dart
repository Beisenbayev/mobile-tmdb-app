import 'package:flutter/material.dart';
import 'package:moovee_land/theme/text_theme.dart';

class ErrorPage extends StatelessWidget {
  final String errorText;

  const ErrorPage({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TMDB',
          style: TextStyleTheme.appBarTitle,
        ),
      ),
      body: Center(
        child: Text(
          errorText,
          style: TextStyleTheme.error,
        ),
      ),
    );
  }
}
