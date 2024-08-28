import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';

final class AlwaysErrorRestaurantsRepository implements RestaurantsRepository {
  const AlwaysErrorRestaurantsRepository();
  
  @override
  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    const duration = Duration(milliseconds: 500);
    await Future.delayed(duration);

    throw Exception('Error for testing Cubit');
  }
}
