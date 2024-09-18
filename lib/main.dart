import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/routes.dart';
import 'package:restaurant_tour/core/services/dio_service.dart';
import 'package:restaurant_tour/core/services/dotenv_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final snackbarKey = GlobalKey<ScaffoldMessengerState>();
  // dotenv
  final dotenvService = DotenvService();
  await dotenvService.init();
  // dio
  DioService.init(
    apiKey: DotenvService.apiKey,
    snackbarKey: snackbarKey,
  );

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
