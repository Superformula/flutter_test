import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
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
    _simulateLoading();
    _fetchRestaurants();
  }

  _fetchRestaurants() async {
    try {
      // final result = await RestaurantsRepository.getRestaurants();
      restaurants = mockRestaurants;
      print('Fetched ${restaurants.length} restaurants');
    } catch (e) {
      print('Failed to fetch restaurants: $e');
    }
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _showProgressIndicator = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('restaurants ${restaurants[0].toJson()}');
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
