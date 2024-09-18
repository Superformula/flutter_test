import 'package:dio/dio.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/core/services/dio_service.dart';
import 'package:restaurant_tour/modules/home/repository/query.dart';

class HomeRepository {
  Future<List<Restaurant>> getRestaurants({int offset = 0}) async {
    final result = await dio.post(
      '/graphql',
      data: query(offset),
      options: Options(
        headers: {
          Headers.contentTypeHeader: 'application/graphql',
        },
      ),
    );
    final data = RestaurantQueryResult.fromJson(
      result.data['data']['search'],
    );
    return data.restaurants ?? [];
  }
}
