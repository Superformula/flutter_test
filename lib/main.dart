import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/dependency_injection.dart';
import 'package:restaurant_tour/core/environment.dart';
import 'package:restaurant_tour/presentation/controllers/favorites/favorites_cubit.dart';
import 'package:restaurant_tour/presentation/controllers/restaurants/restaurants_cubit.dart';
import 'package:restaurant_tour/presentation/pages/home_page.dart';

void main() async {
  await Environment.load();
  await DependencyInjection().init();

  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Tour',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<RestaurantsCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<FavoritesCubit>(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
