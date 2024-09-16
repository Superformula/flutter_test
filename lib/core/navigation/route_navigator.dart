import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_tour/core/helpers/hive_helper.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/home_page/presenter/bloc/home_bloc.dart';
import 'package:restaurant_tour/features/home_page/presenter/page/home_screen.dart';
import 'package:restaurant_tour/features/restaurant_page/presenter/page/restaurant_screen.dart';
import 'package:restaurant_tour/features/splash_screen/presenter/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) =>
      const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(hiveHelper: HiveHelper())..add(const InitialEvent()),
          child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/restaurant-screen',
      name: 'restaurant-screen',
      builder: (BuildContext context, GoRouterState state) {
        final Restaurant restaurant = state.extra as Restaurant;
        return RestaurantScreen(restaurant: restaurant);
      },
    ),
  ],
);