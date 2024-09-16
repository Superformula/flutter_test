import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/exception/app_exception.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/infrastructure/driven_adapters/api/restaurant_api.dart';

import '../../../domain/usecase/restaurant/restaurant_use_case_test.dart';

class MockDio extends Mock implements Dio {}

// class MockResponse extends Mock implements Response {}

void main() {
  group('RestaurantApi Tests', () {
    late RestaurantApi restaurantApi;
    late MockDio mockDio;
    setUpAll(() {
      registerFallbackValue(FakeRestaurantEntity());
    });
    setUp(() {
      mockDio = MockDio();
      restaurantApi = RestaurantApi(dio: mockDio);
    });

    test('returns RestaurantEntity when the response is successful', () async {
      final mockData = {
        'data': {
          'business': {
            'id': '1',
            'name': 'Test Restaurant',
          },
        },
      };
      //arrange
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/v3/graphql'),
        statusCode: 200,
        data: mockData,
      );
      when(
        () => mockDio.get(
          any(),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => mockResponse);
      //act
      final result = await restaurantApi.getRestaurant('1');

      //assert
      expect(result, isNotNull);
      expect(result?.id, '1');
      expect(result?.name, 'Test Restaurant');
      verify(
        () => mockDio.get(
          '/v3/graphql',
          queryParameters: {'id': '1'},
        ),
      ).called(1);
    });
    test('getRestaurants server error', () async {
      when(() => mockDio.post(any(), data: any(named: 'data'))).thenAnswer(
        (_) async => Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      expect(
        () => restaurantApi.getRestaurants(),
        throwsA(
          isA<AppException>().having(
            (e) => e.error,
            'error',
            FetchAppError.serverError,
          ),
        ),
      );
    });

    test('getRestaurants network error', () async {
      when(() => mockDio.post(any(), data: ('data'))).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          error: 'Network error',
        ),
      );

      expect(
        () => restaurantApi.getRestaurants(),
        throwsA(
          isA<AppException>().having(
            (e) => e.error,
            'error',
            FetchAppError.networkError,
          ),
        ),
      );
    });
    // });
    group('getRestaurants', () {
      test('returns list of RestaurantEntity when the response is successful', () async {
        final mockData = {
          'data': {
            'search': {
              'business': [
                {'id': '1', 'name': 'Restaurant A'},
                {'id': '2', 'name': 'Restaurant B'},
              ],
            },
          },
        };
        //arrange
        final mockResponse = Response(
          requestOptions: RequestOptions(path: '/v3/graphql'),
          statusCode: 200,
          data: mockData,
        );

        when(
          () => mockDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).thenAnswer((_) async => mockResponse);

        //act
        final result = await restaurantApi.getRestaurants();
        //assert
        expect(result, isA<List<RestaurantEntity>>());
        expect(result?.length, 2);
        expect(result?[0].id, '1');
        expect(result?[1].id, '2');
        verify(
          () => mockDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).called(1);
      });

      test('returns empty list when restaurantsData is null or empty', () async {
        final mockData = {
          'data': {
            'search': {
              'business': [],
            },
          },
        };
        //arrange
        final mockResponse = Response(
          requestOptions: RequestOptions(path: '/v3/graphql'),
          statusCode: 200,
          data: (mockData),
        );
        when(
          () => mockDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).thenAnswer((_) async => mockResponse);
        //act
        final result = await restaurantApi.getRestaurants();
        //assert
        expect(result, isA<List<RestaurantEntity>>());
        expect(result, isEmpty);
        verify(
          () => mockDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).called(1);
      });

      test('throws AppException on DioError', () async {
        when(
          () => mockDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/v3/graphql'),
            error: 'Network error',
            type: DioExceptionType.unknown,
          ),
        );
        //assert
        expect(
          () => restaurantApi.getRestaurants(),
          throwsA(
            isA<AppException>().having(
              (e) => e.error,
              'type',
              FetchAppError.networkError,
            ),
          ),
        );
        verify(
          () => mockDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).called(1);
      });
    });
  });
}
