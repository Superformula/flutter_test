import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';

import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/presentation/components/restaurant_card.dart';

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

class _AllRestaurantsTabState extends State<AllRestaurantsTab> with AutomaticKeepAliveClientMixin {
  late Future<List<Restaurant>?> restaurantsFuture;

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

        if (snapshot.hasError || snapshot.data == null) {
          return const Center(
            child: Text("Failed to fetch restaurants"),
          );
        }

        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text("No restaurants found"),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final restaurant = snapshot.data![index];
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
    );
  }

}
