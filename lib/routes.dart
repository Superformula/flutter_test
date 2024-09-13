import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:restaurant_tour/home/presentation/page/restaurant_details.dart';

import 'home/presentation/page/home.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class Routes {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/restaurant_details',
        builder: (BuildContext context, GoRouterState state) {
          return const RestaurantDetails();
        },
      ),
    ],
  );
}
