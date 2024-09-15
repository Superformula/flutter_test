import 'package:restaurant_tour/src/features/restaurant_tour/domain/datasources/restaurants_datasource.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantsDatasource datasource;

  RestaurantRepositoryImpl(this.datasource);

  @override
  Future<RestaurantQueryResult> getRestaurants() {
    return datasource.getRestaurants();
  }
}
