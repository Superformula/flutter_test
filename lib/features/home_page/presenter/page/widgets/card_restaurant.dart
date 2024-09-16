import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';


class CardRestaurant extends StatelessWidget {
  const CardRestaurant({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(restaurant.name ?? 'No name provided'),
      ),
    );
  }
}