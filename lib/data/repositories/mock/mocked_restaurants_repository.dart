import 'dart:async';

import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/core/domain/error/data_error.dart';
import 'package:restaurant_tour/data/dtos/restaurant_dto.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

import 'package:restaurant_tour/data/repositories/mock/mocked_cached_response.dart';

import 'package:restaurant_tour/core/domain/error/error.dart';

class MockedRestaurantsRepository extends BaseRestaurantsRepository {
  MockedRestaurantsRepository();

  // This is a simple in memory provider for the favorites
  final List<Restaurant> _favorites = [];
  final StreamController<List<Restaurant>>
      _favoriteRestaurantsStreamController =
      StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get _favoriteRestaurants =>
      _favoriteRestaurantsStreamController.stream;

  @override
  Stream<List<Restaurant>> getFavorites() {
    return _favoriteRestaurants;
  }

  @override
  Future<Result<List<Restaurant>, BaseError>> getRestaurants(
      {int offset = 0}) async {
    try {
      final response = cachedResponse;

      final data = RestaurantDto.fromJson(response['data']['search']);

      if (data.restaurants != null) {
        return Success(data.restaurants!.map((e) => e.toDomain()).toList());
      }

      return Error(UnknownError());
    } catch (e) {
      return Error(UnknownError());
    }
  }

  @override
  void toggleFavorite(Restaurant restaurant) {
    final found =
        _favorites.indexWhere((element) => element.id == restaurant.id) != -1;

    if (found) {
      _favorites.removeWhere((element) => element.id == restaurant.id);
    } else {
      _favorites.add(restaurant);
    }

    _favoriteRestaurantsStreamController.add(_favorites);
  }

  @override
  dispose() {
    _favoriteRestaurantsStreamController.close();
  }
}
