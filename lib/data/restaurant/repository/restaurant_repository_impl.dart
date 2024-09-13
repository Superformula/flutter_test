import 'package:restaurant_tour/app/app.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantExternalDataSource dataSource;

  RestaurantRepositoryImpl(this.dataSource);

  @override
  Future<List<Restaurant>> fetchRestaurants({int offset = 0}) {
    return dataSource.fetchRestaurants(offset: offset);
  }
}
