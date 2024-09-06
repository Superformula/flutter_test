import 'package:restaurant/domain/models/restaurant.dart';

class RouteDetailsParams {
  final Restaurant restaurant;
  final bool mustRefreshWhenPop;

  RouteDetailsParams(
      {required this.restaurant, required this.mustRefreshWhenPop});
}
