import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/utils/model_service.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/router/navigation_controller.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    _checkUserAuth();
  }

  void _checkUserAuth() async {
    final isAuth = await ModelService.checkAuth();
    await Future.delayed(const Duration(seconds: 2));
    if (isAuth) {
      NavigationController.goToHomePage(context);
    } else {
      NavigationController.goToLoginPage(context);
    }
  }

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
