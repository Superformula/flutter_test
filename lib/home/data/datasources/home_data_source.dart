import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../models/restaurant.dart';
import '../../../query.dart';
import '../../failures/failures.dart';
import 'package:http/http.dart' as http;

abstract class HomeDataSourceInterface {
  Future<Either<RestaurantsFailure, RestaurantQueryResult>> getAllRestaurants();
}

class HomeDataSource implements HomeDataSourceInterface {
  HomeDataSource();

  final _apiKey =
      'yT1sJ3lRDxaU8jTfgmRuGnvd0Pj-OAU9KqV8VmQ9rK0L-M8sID9ZN0UmBfmPiMTFTHO11ziGqcb6gILaUj7zdkYUfZoUHshf7HsBUd2LEU5nIASGbkfYLaaUPZ_kZnYx';
  final _baseUrl = 'https://api.yelp.com/v3/graphql';

  @override
  Future<Either<RestaurantsFailure, RestaurantQueryResult>> getAllRestaurants({
    int offset = 0,
  }) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/graphql',
    };

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: query(offset),
      );

      if (response.statusCode == 200) {
        return right(
          RestaurantQueryResult.fromJson(
            jsonDecode(response.body)['data']['search'],
          ),
        );
      } else {
        return left(
          MovieFailure(
            message: 'Failed to load restaurants: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
      return left(
        MovieFailure(
          message: 'Error fetching restaurants: $e',
        ),
      );
    }
  }
}
