import 'package:flutter/material.dart';
import 'package:restaurant_tour/presentation/pages/home_page.dart';

void main() {
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Tour',
      home: HomePage(),
    );
  }
}
