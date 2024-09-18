import 'package:flutter/material.dart';

import 'package:restaurant_tour/modules/home/home_page.dart';
import 'package:restaurant_tour/modules/restaurant_detail/restaurant_detail_page.dart';

class RoutePaths {
  static const String initial = '/';
  static const String restaurantDetail = 'restaurant-detail';
}

Map<String, WidgetBuilder> getRoutes() {
  return {
    RoutePaths.initial: (_) => const HomePage(),
    RoutePaths.restaurantDetail: (_) => const RestaurantDetailPage(),
  };
}
