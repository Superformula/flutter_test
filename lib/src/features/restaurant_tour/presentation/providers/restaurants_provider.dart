import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/providers/restaurants_repository_provider.dart';

final getRestaurantsProvider =
    StateNotifierProvider<RestaurantsNotifier, RestaurantQueryResult>(
  (ref) {
    final restaurantsResponse =
        ref.watch(restaurantsRepositoryProvider).getRestaurants;
    return RestaurantsNotifier(restaurantsCallBack: restaurantsResponse);
  },
);

typedef RestaurantsCallBack = Future<RestaurantQueryResult> Function();

class RestaurantsNotifier extends StateNotifier<RestaurantQueryResult> {
  RestaurantsCallBack restaurantsCallBack;

  RestaurantsNotifier({required this.restaurantsCallBack})
      : super(
          const RestaurantQueryResult(
            restaurants: [],
            total: 0,
          ),
        );
  Future<RestaurantQueryResult> loadRestaurants() async {
    final RestaurantQueryResult restaurants = await restaurantsCallBack();
    state = restaurants;
    return state;
  }

  List<Restaurant> getFavoriteRestaurants(String id) {
    var favoriteRestaurants = <Restaurant>[];

    for (var restaurant in state.restaurants ?? []) {
      if (restaurant.id == id) {
        favoriteRestaurants.add(restaurant);
      }
    }
    return favoriteRestaurants;
  }
}
