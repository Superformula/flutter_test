import '../entities/entities.dart';

abstract class GetRestaurants {
  Future<List<RestaurantEntity>> call();
}
