import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/restaurant_info_view.dart';

class RestaurantInfoPage extends StatefulWidget {
  const RestaurantInfoPage({super.key});

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
          title: const Text('Restaurant Name Goes Here And Wrap 2 Lines'),
        ),
        body: const RestaurantInfoView(),
      ),
    );
  }
}
