import 'dart:developer';
import 'package:restaurant_tour/datasources/yielp_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/utils/sample_json.dart';

class YelpRepository {
  final YielpDatasource datasource;

  YelpRepository({required this.datasource});

  RestaurantQueryResult getRestaurantsFromCache({int offset = 0}) {
    try {
      log('fetching from cache');
      return RestaurantQueryResult.fromJson(sample['data']['search']);
    } catch (e) {
      throw Exception();
    }
  }

  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    try {
      final data = await datasource.fetchRestaurants(offset);
      if (data != null) {
        return RestaurantQueryResult.fromJson(data['data']['search']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
