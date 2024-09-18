import 'package:flutter/material.dart';

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
    return const MaterialApp(
      title: 'Flutter Test',
      home: Scaffold(
        body: Center(
          child: Text('Env load test'),
        ),
      ),
    );
  }
}
