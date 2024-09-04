import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/presentation/view/pages/restaurants_home_page.dart';
import 'package:restaurant/restaurant_module.dart';
import 'package:ui_kit/presentation/theme/theme.dart';

List<SFModule> modules = [RestaurantModule()];

void main() {
  for (var module in modules) {
    module.registerProviders();
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(dynamic)> routes = {};

    for (var module in modules) {
      routes.addAll(module.routes);
    }
    return routes;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      debugShowCheckedModeBanner: false,
      theme: UiKitTheme.theme,
      routes: getRoutes(),
      home: const RestaurantsHomePage(),
    );
  }
}
