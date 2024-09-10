import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/pages/restaurant_details/restaurant_details_page.dart';

import '../../main.dart';
import '../../models/restaurant.dart';
import '../../presentation/pages/restaurant_list/restaurant_list_page.dart';
//import '../../presentation/pages/restaurant_details/restaurant_details_page.dart';

// Define all the route names here
class Routes {
  static const String main = '/';
  static const String restaurantList = '/restaurantList';
  static const String restaurantDetails = '/restaurantDetails';
}

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.restaurantList:
        return MaterialPageRoute(builder: (_) => RestaurantListPage());

      case Routes.restaurantDetails:
        final restaurant = settings.arguments as Restaurant;
        return MaterialPageRoute(
          builder: (_) => RestaurantDetailsPage(restaurant: restaurant),
        );

      default:
        return _errorRoute();  // Error Route for unknown routes
    }
  }

  // Error route in case of invalid navigation
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}