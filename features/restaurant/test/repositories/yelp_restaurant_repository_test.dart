import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/get_restaurant/errors/get_restaurant_errors.dart';
import 'package:restaurant/repositories/yelp_restaurant_repository.dart';

import '../mocks/server_responses.dart';

class MockDio extends Mock implements Dio {}

class MockRestaurantQueryResult extends Mock implements RestaurantQueryResult {}

void main() {
  late YelpRestaurantRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = YelpRestaurantRepository(dio: mockDio);
  });

  group('YelpRestaurantRepository', () {
    test('should return RestaurantQueryResult when the request is successful',
        () async {
      // Given
      final responseData = {
        'data': {
          'search': {
            'total': 100,
            'business': [mockedRestaurant(name: 'Restaurant A')],
          }
        }
      };

      when(() => mockDio.post<Map<String, dynamic>>(
            '/v3/graphql',
            data: any(named: 'data'),
          )).thenAnswer((_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: '/v3/graphql'),
          ));

      // When
      final result = await repository.getRestaurants();

      // Then
      expect(result.isRight, true);
      final right = result.right;
      expect(right, isA<RestaurantQueryResult>());
      expect(right.restaurants.first.name, 'Restaurant A');
    });

    test('should return GetRestaurantError when the request fails', () async {
      // Given
      when(() => mockDio.post<Map<String, dynamic>>(
            '/v3/graphql',
            data: any(named: 'data'),
          )).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/v3/graphql'),
        error: 'Error message',
      ));

      // When
      final result = await repository.getRestaurants();

      // Then
      expect(result.isLeft, true);
      final left = result.left;
      expect(left, isA<GetRestaurantError>());
    });
  });
}
