import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';

import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/presentation/components/restaurant_card.dart';

import '../../../core/domain/error/data_error.dart';
import '../../../core/domain/error/error.dart';

class AllRestaurantsTab extends StatefulWidget {
  final GetRestaurantsUseCase getAllRestaurantsUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final List<Restaurant> favoriteRestaurants;
  final void Function(Restaurant restaurant, bool isFavorite) onTapRestaurant;

  const AllRestaurantsTab({
    super.key,
    required this.getAllRestaurantsUseCase,
    required this.toggleFavoriteUseCase,
    required this.favoriteRestaurants,
    required this.onTapRestaurant,
  });

  @override
  State<AllRestaurantsTab> createState() => _AllRestaurantsTabState();
}

class _AllRestaurantsTabState extends State<AllRestaurantsTab>
    with AutomaticKeepAliveClientMixin {
  late Future<Result<List<Restaurant>, BaseError>> restaurantsFuture;

  @override
  void initState() {
    super.initState();
    restaurantsFuture = widget.getAllRestaurantsUseCase();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder(
      future: restaurantsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }

        return snapshot.data!.when(
          (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final restaurant = data[index];
                final isFavorite = widget.favoriteRestaurants
                        .indexWhere((element) => element.id == restaurant.id) !=
                    -1;

                return RestaurantCard(
                  restaurant: restaurant,
                  onTap: () => widget.onTapRestaurant(restaurant, isFavorite),
                );
              },
            );
          },
          (error) {
            if (error case DataError()) {
              // here we could map data errors
              return switch (error) {
                RateLimitError() => const Center(
                    child: Text("Rate limit exceeded"),
                  ),
                NoInternetConnectionError() => const Center(
                    child: Text("No internet connection"),
                  ),
                _ => const Center(
                    child: Text("Something went wrong"),
                  ),
              };
            }

            // here we can map other errors
            return const Center(
              child: Text("Something went wrong"),
            );
          },
        );
      },
    );
  }
}
