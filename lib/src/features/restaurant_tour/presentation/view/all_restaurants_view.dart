import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/providers/restaurants_provider.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/widgets/restaurant_card.dart';

class AllRestaurantsView extends ConsumerStatefulWidget {
  const AllRestaurantsView({super.key});

  @override
  ConsumerState<AllRestaurantsView> createState() => _AllRestaurantsViewState();
}

class _AllRestaurantsViewState extends ConsumerState<AllRestaurantsView> {
  late List<Restaurant> restaurants;

  bool _dataNotFound = false;
  bool _showProgressIndicator = true;

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    try {
      final result =
          await ref.read(getRestaurantsProvider.notifier).loadRestaurants();
      if (result.restaurants != null && result.restaurants!.isNotEmpty) {
        restaurants = result.restaurants!;
        if (mounted) {
          setState(() {
            _showProgressIndicator = false;
          });
        }
      } else {
        _handleDataNotFound();
      }
    } catch (e) {
      print('Failed to fetch restaurants: $e');
      _handleDataNotFound();
    }
  }

  void _handleDataNotFound() {
    if (mounted) {
      setState(() {
        _showProgressIndicator = false;
        _dataNotFound = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            failedDataText,
          ),
          backgroundColor: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return !_showProgressIndicator
        ? _dataNotFound
            ? const Center(child: Text('Data not found'))
            : ListView.builder(
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
