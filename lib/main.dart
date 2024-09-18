import 'package:flutter/material.dart';

import 'core/core.dart';
import 'restaurant_tour.dart';

void main() async {
  await ApplicationConfig.setUp();
  runApp(const RestaurantTour());
}
