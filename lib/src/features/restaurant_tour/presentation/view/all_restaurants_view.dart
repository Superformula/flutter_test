import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card.dart';

class AllRestaurantsView extends StatefulWidget {
  const AllRestaurantsView({super.key});

  @override
  State<AllRestaurantsView> createState() => _AllRestaurantsViewState();
}

class _AllRestaurantsViewState extends State<AllRestaurantsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: RestaurantCard(),
        );
      },
    );
  }
}
