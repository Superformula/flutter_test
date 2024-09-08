import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_tour/configuration/environment.dart';

import 'models/restaurant_data.dart';

final class RestaurantPage {
  RestaurantPage({required this.offset, required this.restaurants});

  final int offset;
  final List<RestaurantData> restaurants;
}

/// Provides a common interface to access information about restaurants
abstract class RestaurantDataSource {
  // TODO: doc and maybe create policy
  Future<void> addRestaurants({required RestaurantPage page}) async {}
  Future<List<RestaurantReviewData>> getReviewsForRestaurant({required String restaurantId}) async => [];

  Future<List<RestaurantData>> getRestaurants({required int offset, int limit = 1});
  Future<void> dispose();
}

/// A data source capable of loading restaurant information from the backend
/// 
/// It works as if it were in read-only mode, since we do not mutate data.
final class RemoteRestaurantDataSource extends RestaurantDataSource {
  RemoteRestaurantDataSource({@visibleForOverriding Dio? client}) : source = client ?? Environment.createDioClient();

  final Dio source;

  @override
  Future<List<RestaurantData>> getRestaurants({required int offset, int limit = 1}) async {
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

// TODO: fill in implementation
/// A data source that permanently stores all possible data about restaurants already loaded
final class InStorageRestaurantDataSource implements RestaurantDataSource {
  @override
  Future<void> addRestaurants({required RestaurantPage page}) async {}

  @override
  Future<void> dispose() async {
  }

  @override
  Future<List<RestaurantData>> getRestaurants({required int offset, int limit = 1}) async {
    return [];
  }

  @override
  Future<List<RestaurantReviewData>> getReviewsForRestaurant({required String restaurantId}) async {
    return [];
  }
}
