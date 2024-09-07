import 'package:flutter/material.dart';
import 'package:restaurant_tour/di/di.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';
import 'package:restaurant_tour/presentation/screens/home/home_screen.dart';

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
      home: HomeScreen(
        getAllRestaurantsUseCase: getIt.get<GetRestaurantsUseCase>(),
        getFavoriteRestaurantsUseCase:
            getIt.get<GetFavoriteRestaurantsUseCase>(),
        toggleFavoriteUseCase: getIt.get<ToggleFavoriteUseCase>(),
      ),
    );
  }
}
