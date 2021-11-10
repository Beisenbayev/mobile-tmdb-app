import 'package:flutter/material.dart';
import 'package:moovee_land/theme/text_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: const Center(
        child: Text('home'),
      ),
    );
  }
}
