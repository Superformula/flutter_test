import 'package:flutter/material.dart';

import 'package:restaurant_tour/core/routes.dart';
import 'package:restaurant_tour/modules/home/widgets/restaurant_card.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            RoutePaths.restaurantDetail,
          ),
          child: const RestaurantCard(),
        );
      },
    );
  }
}
