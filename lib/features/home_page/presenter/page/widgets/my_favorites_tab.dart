import 'package:flutter/material.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/home_page/presenter/page/widgets/card_restaurant.dart';


class MyFavoritesTab extends StatelessWidget {
  const MyFavoritesTab({
    super.key,
    required this.favoriteList,
  });

  final List<Restaurant> favoriteList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        final restaurant = favoriteList[index];
        return CardRestaurant(
          restaurant: restaurant,
        );
      },
    );
  }
}