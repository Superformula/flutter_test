import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/restaurant_info_view.dart';

class RestaurantInfoPage extends StatefulWidget {
  const RestaurantInfoPage({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantInfoPage> createState() => _RestaurantInfoPageState();
}

class _RestaurantInfoPageState extends State<RestaurantInfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_outline),
              onPressed: () {},
              iconSize: 30,
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 30,
          ),
          title: Text(widget.restaurant.name ?? ''),
        ),
        body: RestaurantInfoView(
          restaurant: widget.restaurant,
        ),
      ),
    );
  }
}
