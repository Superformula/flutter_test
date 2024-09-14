import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart';

List<Restaurant?> restaurantDataToRestaurants(RestaurantQueryResult restaurantsData) {
  final restaurantsDataList = restaurantsData.restaurants ?? [];
  return restaurantsDataList;
}

Restaurant? restaurantDataToRestaurant(RestaurantQueryResult restaurantData, String id) {
  return restaurantData.restaurants?.firstWhere(
    (restaurant) => restaurant.id == id,
  );
}
