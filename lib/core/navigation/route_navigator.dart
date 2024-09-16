import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/home_screen/home_screen.dart';
import 'package:restaurant_tour/features/restaurant_screen/presenter/page/restaurant_screen.dart';
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
        return const HomeScreen();
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