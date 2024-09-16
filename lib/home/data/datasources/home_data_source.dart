import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../models/restaurant.dart';
import '../../../query.dart';
import '../../failures/failures.dart';
import 'package:http/http.dart' as http;

import '../../services/module_communication.dart';
import '../../services/module_communication_interface.dart';
import '../../utils/utils.dart';

abstract class HomeDataSourceInterface {
  Future<Either<RestaurantsFailure, Map<String, RestaurantQueryResult>>>
      getAllRestaurants();
}

class HomeDataSource implements HomeDataSourceInterface {
  HomeDataSource();

  final _apiKey =
      'yT1sJ3lRDxaU8jTfgmRuGnvd0Pj-OAU9KqV8VmQ9rK0L-M8sID9ZN0UmBfmPiMTFTHO11ziGqcb6gILaUj7zdkYUfZoUHshf7HsBUd2LEU5nIASGbkfYLaaUPZ_kZnYx';
  final _baseUrl = 'https://api.yelp.com/v3/graphql';

  @override
  Future<Either<RestaurantsFailure, Map<String, RestaurantQueryResult>>>
      getAllRestaurants({
    int offset = 0,
  }) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/graphql',
    };

    ModuleCommunicationInterface communication =
        ModuleCommunication.getInstance();

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: query(offset),
      );

      if (response.statusCode == 200) {
        RestaurantQueryResult restaurants = RestaurantQueryResult.fromJson(
          jsonDecode(response.body)['data']['search'],
        );
        List<Restaurant> list = await Utils.favoritiesRestaurants(
          communication,
          restaurants.restaurants!,
        );
        return right(
          {
            'allRestaurants': RestaurantQueryResult.fromJson(
              jsonDecode(response.body)['data']['search'],
            ),
            'favoritiesRestaurants': RestaurantQueryResult(
              total: restaurants.total,
              restaurants: list,
            ),
          },
        );
      } else {
        String resp = await Utils.readJson();
        RestaurantQueryResult restaurants = RestaurantQueryResult.fromJson(
          jsonDecode(resp)['data']['search'],
        );
        List<Restaurant> list = await Utils.favoritiesRestaurants(
          communication,
          restaurants.restaurants!,
        );
        return right(
          {
            'allRestaurants': RestaurantQueryResult.fromJson(
              jsonDecode(resp)['data']['search'],
            ),
            'favoritiesRestaurants': RestaurantQueryResult(
              total: restaurants.total,
              restaurants: list,
            ),
          },
        );
      }
    } catch (e) {
      return left(
        RestaurantFailure(
          message: 'Error fetching restaurants: $e',
        ),
      );
    }
  }
}
