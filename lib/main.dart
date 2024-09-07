import 'package:flutter/material.dart';
import 'package:restaurant_tour/di/di.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';
import 'package:restaurant_tour/presentation/screens/home/home_screen.dart';
import 'package:restaurant_tour/presentation/screens/restaurant_details/restaurant_details_screen.dart';

void main() {
  setupDI();
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Tour',
      home: Builder(
        builder: (context) {
          return HomeScreen(
            getAllRestaurantsUseCase: getIt.get<GetRestaurantsUseCase>(),
            getFavoriteRestaurantsUseCase:
                getIt.get<GetFavoriteRestaurantsUseCase>(),
            toggleFavoriteUseCase: getIt.get<ToggleFavoriteUseCase>(),
            onTapRestaurant: (restaurant, isFavorite) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RestaurantDetailsScreen(
                    restaurant: restaurant,
                    isFavorite: isFavorite,
                    onToggleFavorite: () {
                      final toggleFavoriteUseCase =
                          getIt.get<ToggleFavoriteUseCase>();
                      toggleFavoriteUseCase(restaurant);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
