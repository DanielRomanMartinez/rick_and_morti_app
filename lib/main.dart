import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morti_api/application.dart';

import 'injection.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const CharacterYuki());
}