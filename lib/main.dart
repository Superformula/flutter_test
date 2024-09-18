import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/routes.dart';
import 'package:restaurant_tour/core/services/dotenv_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dotenvService = DotenvService();
  await dotenvService.init();

  print('env: ${dotenvService.env}');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      initialRoute: RoutePaths.initial,
      routes: getRoutes(),
    );
  }
}
