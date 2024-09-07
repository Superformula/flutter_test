import 'dart:async';

import 'package:dio/dio.dart';
import 'package:restaurant_tour/data/dtos/restaurant_dto.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

import 'package:restaurant_tour/data/repositories/cached_response.dart';

class RestaurantsRepository extends BaseRestaurantsRepository {
  // I could have created a remote data provider here
  final Dio _httpClient;

  RestaurantsRepository({
    required Dio httpClient,
  }) : _httpClient = httpClient;

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
  Future<List<Restaurant>> getRestaurants({int offset = 0}) async {
    //TODO: Remove this... just to not reach the rate limit
    final response = cachedResponse;

    final data = RestaurantDto.fromJson(response['data']['search']);

    if (data.restaurants != null) {
      return data.restaurants!.map((e) => e.toDomain()).toList();
    }

    return [];

    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '/v3/graphql',
        data: _getRestaurantsQuery(offset),
      );

      final data = RestaurantDto.fromJson(response.data!['data']['search']);

      if (data.restaurants != null) {
        return data.restaurants!.map((e) => e.toDomain()).toList();
      }

      return [];
    } catch (e) {
      return [];
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

  String _getRestaurantsQuery(int offset) {
    return '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: $offset) {
    total    
    business {
      id
      name
      price
      rating
      photos
      reviews {
        id
        rating
        text
        user {
          id
          image_url
          name
        }
      }
      categories {
        title
        alias
      }
      hours {
        is_open_now
      }
      location {
        formatted_address
      }
    }
  }
}
''';
  }
}
