import 'package:flutter/material.dart';
import 'package:moovee_land/utils/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MooVeeLand',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
          foregroundColor: Colors.white,
        ),
      ),
      routes: RouteData.routes,
      initialRoute: RouteData.initialRoute,
    );
  }
}
