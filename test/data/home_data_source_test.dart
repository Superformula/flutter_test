import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/home/data/datasources/home_data_source.dart';
import 'package:restaurant_tour/home/failures/failures.dart';
import 'package:restaurant_tour/home/models/restaurant.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  final dio = MockDio();
  final mockResponse = MockResponse();
  late HomeDataSource datasource;

  setUpAll(() {
    datasource = HomeDataSource();
  });

  test("Should return a valid response when success", () async {
    when(() => mockResponse.statusCode).thenReturn(200);
    when(() => mockResponse.data).thenReturn(<String, dynamic>{});
    when(
      () => dio.post(
        any(),
        data: any(named: "data"),
      ),
    ).thenAnswer((_) async => mockResponse);

    final result = await datasource.getAllRestaurants();

    expect(
      result,
      isA<Either<RestaurantsFailure, Map<String, RestaurantQueryResult>>>(),
    );
  });
}
