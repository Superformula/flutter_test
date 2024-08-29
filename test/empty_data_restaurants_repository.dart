import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';

final class EmptyDataRestaurantsRepository implements RestaurantsRepository {
  const EmptyDataRestaurantsRepository();

  @override
  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    const duration = Duration(milliseconds: 500);
    await Future.delayed(duration);

    return const RestaurantQueryResult(
      total: 0,
      restaurants: [],
    );
  }
}
