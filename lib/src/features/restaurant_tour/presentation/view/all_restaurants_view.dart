import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/restaurants_repository.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card.dart';

class AllRestaurantsView extends StatefulWidget {
  const AllRestaurantsView({super.key});

  @override
  State<AllRestaurantsView> createState() => _AllRestaurantsViewState();
}

class _AllRestaurantsViewState extends State<AllRestaurantsView> {
  late List<Restaurant> restaurants;

  bool _showProgressIndicator = true;

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  _fetchRestaurants() async {
    try {
      final result = await RestaurantsRepository.getRestaurants();
      if (result != null) {
        restaurants = result.restaurants!;
        if (mounted) {
          setState(() {
            _showProgressIndicator = false;
          });
        }
      }
      // restaurants = mockRestaurants;
    } catch (e) {
      print('Failed to fetch restaurants: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return !_showProgressIndicator
        ? ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RestaurantCard(
                  restaurant: restaurants[index],
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
  }
}
