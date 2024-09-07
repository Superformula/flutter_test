import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_tour/configuration/environment.dart';

/// Provides a common interface to access information about restaurants
abstract interface class RestaurantDataSource {
  // TODO: doc and maybe create policy
  void addRestaurants({required Map<int, List<void>> restaurants});
  Future<void> getRestaurants({required int offset});
  Future<void> getReviewsForRestaurant({required String id});
  Future<void> dispose();
}

/// A data source capable of loading restaurant information from the backend
final class RemoteRestaurantDataSource implements RestaurantDataSource {
  RemoteRestaurantDataSource({@visibleForOverriding Dio? client}) : source = client ?? Environment.createDioClient();

  final Dio source;

  @override
  Future<void> getRestaurants({required int offset}) {
    // TODO: implement getRestaurants
    throw UnimplementedError();
  }

  @override
  Future<void> getReviewsForRestaurant({required String id}) {
    // TODO: implement getReviewsForRestaurant
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() async => source.close();

  @override
  void addRestaurants({required Map<int, List<void>> restaurants}) {
    // TODO: implement addRestaurants
  }
}

/// A data source that stores restaurant information for fast access
final class InMemoryRestaurantDataSource implements RestaurantDataSource {
  final cache = {};

  @override
  Future<void> getRestaurants({required int offset}) {
    // TODO: implement getRestaurants
    throw UnimplementedError();
  }

  @override
  Future<void> getReviewsForRestaurant({required String id}) {
    // TODO: implement getReviewsForRestaurant
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() async => cache.clear();

  @override
  void addRestaurants({required Map<int, List<void>> restaurants}) {
    // TODO: implement addRestaurants
  }
}

/// A data source that permanently stores all possible data about restaurants already loaded
final class InStorageRestaurantDataSource implements RestaurantDataSource {
  @override
  void addRestaurants({required Map<int, List<void>> restaurants}) {}

  @override
  Future<void> dispose() {
    throw UnimplementedError();
  }

  @override
  Future<void> getRestaurants({required int offset}) {
    throw UnimplementedError();
  }

  @override
  Future<void> getReviewsForRestaurant({required String id}) {
    throw UnimplementedError();
  }
}
