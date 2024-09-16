import 'package:flutter/material.dart';
import 'package:restaurant_tour/home/presentation/widgets/restaurant_card.dart';

import '../../../models/restaurant.dart';

class AllRestaurantsTab extends StatefulWidget {
  final List<Restaurant> allRestaurants;
  const AllRestaurantsTab({
    super.key,
    required this.allRestaurants,
  });

  @override
  State<AllRestaurantsTab> createState() => _AllRestaurantsTabState();
}

DateTime selectedDate = DateTime.now();

class _AllRestaurantsTabState extends State<AllRestaurantsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.allRestaurants.length,
              itemBuilder: (_, index) => RestaurantCard(
                photo: widget.allRestaurants[index].photos?.first ?? '',
                name: widget.allRestaurants[index].name!,
                price: widget.allRestaurants[index].price ?? '',
                rating: widget.allRestaurants[index].rating!,
                isOpenNow: widget.allRestaurants[index].isOpen,
                category:
                    widget.allRestaurants[index].categories?.first.title! ?? '',
                data: widget.allRestaurants[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
