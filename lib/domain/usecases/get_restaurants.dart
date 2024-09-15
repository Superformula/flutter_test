import '../entities/entities.dart';

abstract class GetRestaurants<T> {
  Future<List<RestaurantEntity>> call(T data);
}
