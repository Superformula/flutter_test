import 'package:restaurant_tour/models/restaurant_data.dart';

import 'restaurant_data_source.dart';

/// The single source of truth for restaurant data access
final class RestaurantRepository extends RestaurantDataSource {
  RestaurantRepository({
    required this.remoteDataSoruce,
    required this.localDataSource,
  });

  final RestaurantDataSource remoteDataSoruce;
  final RestaurantDataSource localDataSource;

  final _pagesCache = <int, RestaurantPage>{};
  final _restaurantsCache = <String, RestaurantData>{};

  @override
  Future<List<RestaurantData>> getRestaurants({required int offset, int limit = 1}) async {
    if (_pagesCache[offset] != null) {
      return _restaurantsCache.values.toList(growable: false);
    } else {
      final localRestaurants = await localDataSource.getRestaurants(offset: offset, limit: limit);

      // We have data stored on disk, so we put it into memmory
      if (localRestaurants.isNotEmpty) {
        _pagesCache[offset] = RestaurantPage(offset: offset, restaurants: localRestaurants);

        _restaurantsCache.addAll(
          Map.fromEntries(
            localRestaurants.map(
              (restaurant) => MapEntry(restaurant.id, restaurant),
            ),
          ),
        );
      } else {
        final remoteRestaurants = await remoteDataSoruce.getRestaurants(offset: offset, limit: limit);

        await localDataSource.addRestaurants(
          page: RestaurantPage(offset: offset, restaurants: remoteRestaurants),
        );

        _pagesCache[offset] = RestaurantPage(offset: offset, restaurants: remoteRestaurants);

        _restaurantsCache.addAll(
          Map.fromEntries(
            remoteRestaurants.map(
              (restaurant) => MapEntry(restaurant.id, restaurant),
            ),
          ),
        );

        return _restaurantsCache.values.toList(growable: false);
      }

      return [];
    }
  }

  @override
  Future<List<RestaurantReviewData>> getReviewsForRestaurant({required String restaurantId}) async {
    if (_restaurantsCache[restaurantId] case final restaurant?) {
      return restaurant.reviews;
    } else {
      return [];
    }
  }

  @override
  Future<void> dispose() async {
    _pagesCache.clear();
    _restaurantsCache.clear();
    remoteDataSoruce.dispose();
    localDataSource.dispose();
  }

  @override
  Future<void> addRestaurants({required RestaurantPage page}) async {
    _pagesCache[page.offset] = page;
    await localDataSource.addRestaurants(page: page);
  }

  Future<void> favoritate({required String restaurantId, required int offset, bool isFavorite = false}) async {
    if (_restaurantsCache[restaurantId] case final restaurant?) {
      _restaurantsCache[restaurantId] = restaurant.copyWith(isFavorite: isFavorite);

      if (_pagesCache[offset] case final restaurantPage?) {
        final restaurants = [
          for (final restaurant in restaurantPage.restaurants)
            if (restaurant.id == restaurantId) restaurant.copyWith(isFavorite: isFavorite) else restaurant,
        ];

        final page = RestaurantPage(offset: offset, restaurants: restaurants);

        _pagesCache[offset] = page;

        await localDataSource.addRestaurants(page: page);
      }
    }
  }

  List<RestaurantData> get favorites {
    return _restaurantsCache.values.where((restaurant) => restaurant.isFavorite).toList(growable: false);
  }

  RestaurantData? getSingleFavoriteRestaurantOr({required String restaurantId}) {
    return _restaurantsCache[restaurantId];
  }
}
