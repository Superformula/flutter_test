import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/app_init.dart';
import 'package:restaurant_tour/core/navigation/route_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInit.initializeApp();
  runApp(
    const RestaurantTour(),
  );
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Restaurant Tour',
    );
  }
}