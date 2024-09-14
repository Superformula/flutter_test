import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

class RestaurantsRepository {
  static const _apiKey =
      'y0RvKbozyu07RfpByqrdTJGyAOzhaNZH9T5X5pzBOoSh9uqOULc8h6yx89Z5nPjYtNaPHp9aqX0ZKF5pHSuYTeWcrYJS9r4EoHb7WmVLKPSmPW-L0FloXZJUInTkZnYx';
  static const _baseUrl = 'https://api.yelp.com/v3/graphql';

  static RestaurantQueryResult? _restaurantsResponse;

  static Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/graphql',
    };

    try {
      // final response = await http.post(
      //   Uri.parse(_baseUrl),
      //   headers: headers,
      //   body: query(offset),
      // );

      // if (response.statusCode == 200) {
      //   _restaurantsResponse = RestaurantQueryResult.fromJson(
      //     jsonDecode(response.body)['data']['search'],
      //   );
      //   return _restaurantsResponse;
      // } else {
      //   print('Failed to load restaurants: ${response.statusCode}');
      //   return null;
      // }
      return _restaurantsResponse = RestaurantQueryResult(
        restaurants: mockRestaurants,
        total: 5,
      );
    } catch (e) {
      print('Error fetching restaurants: $e');
      return null;
    }
  }

  static List<Restaurant> getFavoriteRestaurants(String id) {
    var favoriteRestaurants = <Restaurant>[];

    for (var restaurant in _restaurantsResponse!.restaurants!) {
      if (restaurant.id == id) {
        favoriteRestaurants.add(restaurant);
      }
    }
    for (var i = 0; i < favoriteRestaurants.length; i++) {
      print('rest $i : ${favoriteRestaurants[i].name}');
    }
    return favoriteRestaurants;
  }
}
