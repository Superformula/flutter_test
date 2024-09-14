import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/core/dependency_injection/service_locator.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';
import 'package:restaurant_tour/view/pages/home/home_page.dart';

import 'data/repositories/yelp_repository.dart';
import 'view/cubit/restaurants/restaurants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<RestaurantsCubit>(
              create: (context) =>
                  RestaurantsCubit(dependency<YelpRepository>()),
            ),
            BlocProvider<FavoriteCubit>(
              create: (context) => FavoriteCubit(),
            ),
          ],
          child: const HomePage(),
        ),
      );
}
