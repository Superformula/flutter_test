import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/home/data/datasources/home_data_source.dart';
import 'package:restaurant_tour/home/data/repositories/home_repository.dart';
import 'package:restaurant_tour/home/failures/failures.dart';
import 'package:restaurant_tour/home/models/restaurant.dart';
import 'package:restaurant_tour/home/utils/utils.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

@GenerateMocks(<Type>[MockHomeRepository])
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late MockHomeRepository mockRepo;
  late Map<String, RestaurantQueryResult> expected;
  late String resp;
  late RestaurantQueryResult restaurants;

  setUp(() async {
    mockRepo = MockHomeRepository();
    resp = await Utils.readJson();
    restaurants = RestaurantQueryResult.fromJson(
      jsonDecode(resp)['data']['search'],
    );

    expected = {
      'allRestaurants': RestaurantQueryResult.fromJson(
        jsonDecode(resp)['data']['search'],
      ),
      'favoritiesRestaurants': RestaurantQueryResult(
        total: restaurants.total,
        restaurants: [],
      ),
    };
  });

  test('getAllRestaurants should return data', () async {
    when(mockRepo.getAllRestaurants()).thenAnswer(
      (_) async => right(
        {
          'allRestaurants': RestaurantQueryResult.fromJson(
            jsonDecode(resp)['data']['search'],
          ),
          'favoritiesRestaurants': RestaurantQueryResult(
            total: restaurants.total,
            restaurants: [],
          ),
        },
      ),
    );
    final HomeDataSource articleRepo = HomeDataSource();
    final Either<RestaurantsFailure, Map<String, RestaurantQueryResult>>
        response = await articleRepo.getAllRestaurants();
    expect(expected, response);
  });
}
