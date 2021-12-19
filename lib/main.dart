import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/app_model.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _model = AppModel();
  await _model.checkAuth();

  runApp(App(model: _model));
}
