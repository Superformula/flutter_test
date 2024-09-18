import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/data/datasource/graphql/query.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_tour/common/enviorment/enviorment.dart';

class GraphqlRestaurantsDatasource implements RestaurantsDatasource {
  @override
  Future<List<Restaurant>> getRestaurants({
    int offset = 0,
    int limit = 10,
  }) async {
    final headers = {
      'Authorization': 'Bearer $yelpApiKey',
      'Content-Type': 'application/graphql',
    };

    try {
      final response = await http.post(
        Uri.parse(yelpBaseUrl),
        headers: headers,
        body: query(offset, limit),
      );

      if (response.statusCode == 200) {
        var logger = Logger();
        logger.t("Trace log");

        final map = jsonDecode(response.body);
        final data = map['data'] as Map<String, dynamic>;
        final search = data['search'] as Map<String, dynamic>;
        final total = search['total'] as int;
        final businessesJson = search['business'] as List;

        final businesses = businessesJson
            .map((business) => Restaurant.fromJson(business))
            .toList();

        debugPrint('Total restaurants: $total');

        return businesses ?? [];
      } else {
        throw RestaurantListException(
          description: 'Failed to load restaurants: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw RestaurantListException(
        description: 'Error fetching restaurants: $e',
      );
    }
  }
}
