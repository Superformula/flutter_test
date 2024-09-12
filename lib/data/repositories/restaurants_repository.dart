import 'dart:async';

import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/data/dtos/restaurant_dto.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

import 'package:restaurant_tour/core/domain/error/data_error.dart';
import 'package:restaurant_tour/core/domain/error/error.dart';

class RestaurantsRepository extends BaseRestaurantsRepository {
  // I could have created a remote data provider for this
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
  Future<Result<List<Restaurant>, BaseError>> getRestaurants(
      {int offset = 0}) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '/v3/graphql',
        data: _getRestaurantsQuery(offset),
      );

      final data = RestaurantDto.fromJson(response.data!['data']['search']);

      if (data.restaurants != null) {
        return Success(data.restaurants!.map((e) => e.toDomain()).toList());
      }

      return Error(UnknownError());
    } on DioException catch (e) {
      // we could map all network errors here and create something to share the logic
      // here a simple example
      if (e.response?.statusCode == 400) {
        return Error(RateLimitError());
      }

      return switch (e.type) {
        DioExceptionType.badResponse => Error(UnknownError()),
        DioExceptionType.connectionTimeout => Error(TimeoutError()),
        DioExceptionType.connectionError => Error(NoInternetConnectionError()),
        _ => Error(UnknownError()),
      };
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
