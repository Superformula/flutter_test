import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:restaurant_tour/configuration/environment.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';

/// An associationg between restaurants and an [offset]
///
/// A [RestaurantPage] is considered the smallest unit of pagination.
final class RestaurantPage {
  RestaurantPage({required this.offset, required this.restaurants});

  final int offset;
  final List<RestaurantData> restaurants;
}

/// Provides a common interface to access information about restaurants
abstract class RestaurantDataSource {
  /// Saves restaurants associated with an offset
  Future<void> addRestaurants({required RestaurantPage page}) async {}

  /// Gets all available reviews for a restaurant with the given [restaurantId]
  Future<List<RestaurantReviewData>> getReviewsForRestaurant({required String restaurantId}) async => [];

  /// Load restaurants for a given [offset] observing a [limit]
  Future<List<RestaurantData>> getRestaurants({required int offset, int limit = 20});

  /// Disposes of any unecessary resource
  Future<void> dispose();
}

/// A data source capable of loading restaurant information from the backend
///
/// It works as if it were in read-only mode, since we do not mutate data.
class RemoteRestaurantDataSource extends RestaurantDataSource {
  RemoteRestaurantDataSource({@visibleForOverriding Dio? client}) : source = client ?? Environment.createDioClient();

  final Dio source;

  @override
  Future<List<RestaurantData>> getRestaurants({required int offset, int limit = 20}) async {
    final query = '''
query getRestaurants {
  search(location: "Las Vegas", limit: $limit, offset: $offset) {
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

    final response = await source.post<Map<String, Object?>>('/v3/graphql', data: query);

    if (response.data?['data'] case final Map<String, Object?> data?) {
      if (data['search'] case final Map<String, Object?> search) {
        final queryData = RestaurantDataQuery.fromJson(search);
        return queryData.restaurants;
      }
    }

    return [];
  }

  @override
  Future<void> dispose() async => source.close();
}

/// A data source that permanently stores all possible data about restaurants already loaded
class InStorageRestaurantDataSource extends RestaurantDataSource {
  InStorageRestaurantDataSource() {
    boxInitializer = Completer();
    boxInitializer.complete(Hive.openLazyBox<String>(kRestaurantsBox));
  }

  static const kRestaurantsBox = 'restaurants';

  late final Completer<LazyBox<String>> boxInitializer;

  @override
  Future<void> addRestaurants({required RestaurantPage page}) async {
    await boxInitializer.future;
    final storage = Hive.lazyBox<String>(kRestaurantsBox);

    if (storage.isOpen) {
      await storage.put(
        page.offset,
        jsonEncode(
          [for (final restaurant in page.restaurants) restaurant.toJson()],
        ),
      );
    }
  }

  @override
  Future<void> dispose() async {
    await boxInitializer.future;
    final storage = Hive.lazyBox<String>(kRestaurantsBox);

    if (storage.isOpen) {
      await storage.compact();
      await storage.close();
    }
  }

  @override
  Future<List<RestaurantData>> getRestaurants({required int offset, int limit = 20}) async {
    await boxInitializer.future;
    final storage = Hive.lazyBox<String>(kRestaurantsBox);

    if (storage.isOpen) {
      final data = await storage.get(offset);

      if (data case final String pageData?) {
        final data = jsonDecode(pageData) as List<Object?>;
        return data
            .cast<Map<String, Object?>>() //
            .map((restaurant) => RestaurantData.fromJson(restaurant))
            .toList(growable: false);
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
