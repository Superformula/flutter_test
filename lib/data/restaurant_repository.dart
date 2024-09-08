import 'package:restaurant_tour/data/models/restaurant_data.dart';

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
    // We try always our memory cache first
    if (_pagesCache[offset] case final page?) {
      return page.restaurants;
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

        return _pagesCache[offset]!.restaurants;
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

        await localDataSource.addRestaurants(
          page: RestaurantPage(offset: offset, restaurants: restaurants),
        );
      }
    }
  }

  List<RestaurantData> get favorites {
    return _restaurantsCache.values.where((restaurant) => restaurant.isFavorite).toList(growable: false);
  }
}
