import 'package:restaurant_gql_client/restaurant_gql_client.dart';
import 'package:restaurant_models/restaurant_models.dart';

/// {@template restaurant_repository}
/// Repository for restaurants
/// {@endtemplate}
class RestaurantRepository {
  /// {@macro restaurant_repository}
  const RestaurantRepository(RestaurantGqlClient restaurantGqlClient)
      : _restaurantGqlClient = restaurantGqlClient;

  final RestaurantGqlClient _restaurantGqlClient;

  Future<RestaurantQueryResult?> fetchRestaurants({int offset = 0}) async {
    try {
      final response = await _restaurantGqlClient.getRestaurants(
        offset: offset,
      );
      return response;
    } catch (error) {
      throw Exception(error);
    }
  }
}
