import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/repositories/repositories.dart';
import 'package:restaurant_tour/theme/text.dart';
import 'pages/home_page.dart';
import 'usecases/fetch_restaurants.dart';

void main() {
  setup();
  runApp(const RestaurantTour());
}

void setup() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<YelpRepository>(YelpRepository());

  getIt.registerSingleton<FetchRestaurants>(
    FetchRestaurants(repository: getIt<YelpRepository>()),
  );
  getIt.registerFactory<RestaurantCubit>(
    () => RestaurantCubit(getIt<FetchRestaurants>()),
  );
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      home: const HomePageBlocProvider(),
      theme: ThemeData(
        fontFamily: 'Lora',
        textTheme: ThemeText.textTheming,
      ),
    );
  }
}
