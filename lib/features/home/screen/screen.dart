import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/home/content/home_content.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_list/restaurant_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RestaurantListCubit(
            restaurantRepository: context.read<RestaurantRepository>(),
          )..getRestaurants(),
        ),
      ],
      child: const HomeContent(),
    );
  }
}
