import 'package:restaurant_tour/core/models/restaurant.dart';

class DetailPageArgurments {
  final Restaurant restaurant;
  final bool isFromFavorite;

  DetailPageArgurments({
    required this.restaurant,
    required this.isFromFavorite,
  });
}
