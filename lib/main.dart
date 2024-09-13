import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/pages/restaurant_tour_page.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: RestaurantTourPage(),
      ),
    );
  }
}
