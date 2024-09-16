import 'package:flutter/material.dart';
import 'package:restaurant_tour/ui/pages/home/home_page.dart';
import 'package:restaurant_tour/ui/pages/detail_restaurant/restaurant_details_page.dart';
import 'package:restaurant_tour/ui/pages/restaurants/restaurant_list_page.dart';

class AppRoutes {
  AppRoutes._(); // Private constructor to prevent instantiation.
  static const String home = '/';
  static const String restaurantList = '/restaurantList';
  static const String restaurantDetails = '/restaurantDetails';
}

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.restaurantList:
        return MaterialPageRoute(builder: (_) => const RestaurantListPage());
      case AppRoutes.restaurantDetails:
        return MaterialPageRoute(builder: (_) => const RestaurantDetailsPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Page cannot be found'),
        ),
      ),
    );
  }
}
