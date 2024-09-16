import 'package:flutter/material.dart';
import 'package:restaurant_tour/home/models/restaurant.dart';

import '../widgets/restaurant_card.dart';

class MyFavoritiesTab extends StatefulWidget {
  final List<Restaurant> favoritiesRestaurants;
  const MyFavoritiesTab({
    super.key,
    required this.favoritiesRestaurants,
  });

  @override
  State<MyFavoritiesTab> createState() => _MyFavoritiesTabState();
}

DateTime selectedDate = DateTime.now();

class _MyFavoritiesTabState extends State<MyFavoritiesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.favoritiesRestaurants.isEmpty
                ? const Center(child: Text('No favorities found.'))
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.favoritiesRestaurants.length,
                    itemBuilder: (_, index) => RestaurantCard(
                      photo:
                          widget.favoritiesRestaurants[index].photos?.first ??
                              '',
                      name: widget.favoritiesRestaurants[index].name!,
                      price: widget.favoritiesRestaurants[index].price ?? '',
                      rating: widget.favoritiesRestaurants[index].rating!,
                      isOpenNow: widget.favoritiesRestaurants[index].isOpen,
                      category: widget.favoritiesRestaurants[index].categories
                              ?.first.title! ??
                          '',
                      data: widget.favoritiesRestaurants[index],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
