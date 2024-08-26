import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/datasources/yielp_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/network/dio_http_client.dart';
import 'package:restaurant_tour/repositories/repositories.dart';
import 'package:restaurant_tour/utils/sample_json.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

String fakequery = '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: 0) {
    total    
    business {
      id
      name
      price
      rating
      photos
      reviews {
        id
        rating
        text
        user {
          id
          image_url
          name
        }
      }
      categories {
        title
        alias
      }
      hours {
        is_open_now
      }
      location {
        formatted_address
      }
    }
  }
}
''';
void main() {
  late YelpRepository repository;
  late MockDio mockDio;
  setUp(() {
    mockDio = MockDio();
    repository = YelpRepository(
      datasource: YielpDatasource(
        networkClient: DioHttpClient(dio: mockDio),
        baseUrl: 'https://example.com',
      ),
    );
  });

  // test('Get Restaurants should return a RestaurantQueryResult', () async {
  //   final response = Response(
  //     requestOptions: RequestOptions(path: 'https://example.com'),
  //     data: sample,
  //     statusCode: 200,
  //   );
  //   final requestData = {'key': 'value'};

  //   // final mockResponse = MockResponse();
  //   // when(() => mockResponse.data).thenReturn(aaaaa);
  //   // when(() => mockResponse.statusCode).thenReturn(200);
  //   when(() => mockDio.post(
  //         any(),
  //         data: fakequery,
  //       )).thenAnswer((_) async => response);

  //   final result = await repository.getRestaurants();

  //   expect(result, isA<Response>());

  //   expect(result, isNotNull);
  // });
  test('fromJson should parse the sample data correctly', () {
    final result = RestaurantQueryResult.fromJson(sample['data']['search']);
    expect(result, isNotNull);
    expect(result, isA<RestaurantQueryResult>());
  });
  test('returns null on error', () async {
    // Arrange
    when(() => mockDio.post<Map<String, dynamic>>(
          any(),
          data: any(named: 'data'),
        )).thenThrow(DioError(
      requestOptions: RequestOptions(path: '/v3/graphql'),
    ));

    // Act
    final result = await repository.getRestaurants();

    // Assert
    expect(result, isNull);
  });
}
