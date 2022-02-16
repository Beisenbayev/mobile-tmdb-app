import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorThemeShelf.mainBackground,
      body: Center(
        child: Image.asset('assets/logos/logotype.png'),
      ),
    );
  }
}
