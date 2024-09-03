// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:restaurant_tour/aplication/yelp/yelp_bloc.dart' as _i6;
import 'package:restaurant_tour/domain/models/restaurant.dart' as _i5;
import 'package:restaurant_tour/presentation/pages/home/home_page.dart' as _i1;
import 'package:restaurant_tour/presentation/pages/home/restaurant_details_page.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(),
      );
    },
    RestaurantDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailsRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.RestaurantDetailsPage(
          key: args.key,
          restaurant: args.restaurant,
          yelpBloc: args.yelpBloc,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.RestaurantDetailsPage]
class RestaurantDetailsRoute
    extends _i3.PageRouteInfo<RestaurantDetailsRouteArgs> {
  RestaurantDetailsRoute({
    _i4.Key? key,
    required _i5.Restaurant restaurant,
    required _i6.YelpBloc yelpBloc,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          RestaurantDetailsRoute.name,
          args: RestaurantDetailsRouteArgs(
            key: key,
            restaurant: restaurant,
            yelpBloc: yelpBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'RestaurantDetailsRoute';

  static const _i3.PageInfo<RestaurantDetailsRouteArgs> page =
      _i3.PageInfo<RestaurantDetailsRouteArgs>(name);
}

class RestaurantDetailsRouteArgs {
  const RestaurantDetailsRouteArgs({
    this.key,
    required this.restaurant,
    required this.yelpBloc,
  });

  final _i4.Key? key;

  final _i5.Restaurant restaurant;

  final _i6.YelpBloc yelpBloc;

  @override
  String toString() {
    return 'RestaurantDetailsRouteArgs{key: $key, restaurant: $restaurant, yelpBloc: $yelpBloc}';
  }
}
