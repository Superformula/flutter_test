import 'dart:async';

import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/core/domain/error/data_error.dart';
import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/data/models/restaurant.dart'
    as restaurant_data_model;
import 'package:restaurant_tour/data/repositories/datasource/restaurant_local_data_source.dart';
import 'package:restaurant_tour/data/repositories/datasource/restaurant_remote_data_source.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';

class RestaurantsRepository extends BaseRestaurantsRepository {
  RestaurantsRepository({
    required BaseRestaurantRemoteDataSource remoteDataSource,
    required BaseRestaurantLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final BaseRestaurantRemoteDataSource _remoteDataSource;
  final BaseRestaurantLocalDataSource _localDataSource;

  @override
  Stream<List<Restaurant>> getFavorites() {
    return _localDataSource
        .getFavorites()
        .map((event) => event.map((e) => e.toDomain()).toList());
  }

  @override
  Future<Result<List<Restaurant>, BaseError>> getRestaurants({
    int offset = 0,
  }) async {
    final data = await _remoteDataSource.getRestaurants(offset: offset);

    if (data.isError()) {
      // failed to fetch data from the remote source, let's try to get it from the local source
      final localData =
          (await _localDataSource.getRestaurants()).tryGetSuccess();

      if (localData == null) {
        return Error(ReadLocalDataError());
      }

      return Success(localData.map((e) => e.toDomain()).toList());
    }

    // we have the data from the remote source, let's work on it
    try {
      // cache it
      final cacheOperationResult =
          await _localDataSource.insertRestaurants(data.getOrThrow());

      if (cacheOperationResult.isError()) {
        return Error(SaveDataError());
      }

      return Success(data.getOrThrow().map((e) => e.toDomain()).toList());
    } catch (e) {
      return Error(UnknownError());
    }
  }

  @override
  void toggleFavorite(Restaurant restaurant) {
    _localDataSource.toggleFavorite(
      restaurant_data_model.Restaurant.fromDomain(restaurant),
    );
  }

  @override
  dispose() {}
}
