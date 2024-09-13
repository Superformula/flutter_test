import 'package:restaurant_tour/app/app.dart';

abstract class RestaurantRepository {
  Future<List<Restaurant>> fetchRestaurants({int offset = 0});
}
