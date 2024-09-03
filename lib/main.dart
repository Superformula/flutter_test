import 'package:flutter/material.dart';
import 'package:restaurant_tour/di.dart';
import 'package:restaurant_tour/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      routes: Routes.routes,
      initialRoute: Routes.listRestaurants,
    );
  }
}
