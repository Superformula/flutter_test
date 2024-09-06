import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/app_exceptions.dart';
import 'package:restaurant_tour/features/restaurant/data/data_sources/remote_datasource.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  final dio = MockDio();
  final mockResponse = MockResponse();
  late RemoteDatasource datasource;

  setUpAll(() {
    datasource = RemoteDatasourceImpl(dio: dio);
  });

  group("getRestaurants |", () {
    test("Should throw an AppException when occurs any error", () async {
      // Arrange
      when(() => dio.post(any(), data: any(named: "data"))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 400,
        ),
      );

      // Act
      final call = datasource.getRestaurants();

      // Assert
      expect(() => call, throwsA(const TypeMatcher<ServerException>()));
    });

    test("Should return a Map<String, dynamic> when success", () async {
      // Arrange
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn(<String, dynamic>{});
      when(
        () => dio.post(
          any(),
          data: any(named: "data"),
        ),
      ).thenAnswer((_) async => mockResponse);

      // Act
      final result = await datasource.getRestaurants();

      // Assert
      expect(result, isA<Map<String, dynamic>>());
      verifyNever(() => dio.post(any())).called(0);
    });
  });
}
