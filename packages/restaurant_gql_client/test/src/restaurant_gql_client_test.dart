import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_gql_client/restaurant_gql_client.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeHttpResponse extends Fake implements http.Response {}

void main() {
  late MockHttpClient mockHttpClient;
  late RestaurantGqlClient restaurantGqlClient;

  const baseUrl = 'https://api.yelp.com/v3/graphql';
  const apiKey = 'dummyApiKey';

  setUpAll(() {
    registerFallbackValue(FakeHttpResponse());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    restaurantGqlClient = RestaurantGqlClient(mockHttpClient, baseUrl, apiKey);
  });

  group('RestaurantGqlClient', () {
    const headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/graphql',
    };

    test('successfully fetches restaurants', () async {
      final mockResponseData = {
        'data': {
          'search': {
            'total': 1,
            'business': [
              {
                'id': 'vHz2RLtfUMVRPFmd7VBEHA',
                'name': 'Test Restaurant',
                'price': r'$$',
                'rating': 4.5,
                'photos': ['https://example.com/photo.jpg'],
                'reviews': [
                  {
                    'id': 'F88H5ow44AmiwisbrbswPw',
                    'rating': 5,
                    'text': 'Great food!',
                    'user': {
                      'id': 'y742Fi1jF_JAqq5sRUlLEw',
                      'image_url': 'https://example.com/user.jpg',
                      'name': 'John Doe',
                    },
                  },
                ],
                'categories': [
                  {'title': 'Italian', 'alias': 'italian'},
                ],
                'hours': [
                  {'is_open_now': true},
                ],
                'location': {
                  'formatted_address': '123 Main St, City, Country',
                },
              }
            ],
          },
        },
      };

      final mockResponse = http.Response(jsonEncode(mockResponseData), 200);

      when(
        () => mockHttpClient.post(
          Uri.parse(baseUrl),
          headers: headers,
          body: any(named: 'body'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await restaurantGqlClient.getRestaurants();

      expect(result?.restaurants?.first.name, 'Test Restaurant');
      expect(result?.restaurants?.first.rating, 4.5);
      expect(result?.restaurants?.first.isOpen, true);
      expect(result?.restaurants?.first.displayCategory, 'Italian');
    });

    test('throws ApiException on non-200 status code', () async {
      final mockResponse = http.Response('{"error": "Not found"}', 404);

      when(
        () => mockHttpClient.post(
          Uri.parse(baseUrl),
          headers: headers,
          body: any(named: 'body'),
        ),
      ).thenAnswer((_) async => mockResponse);

      expect(
        () async => restaurantGqlClient.getRestaurants(),
        throwsA(
          isA<ApiException>().having(
            (e) => e.toString(),
            'toString',
            contains(
              'ApiException(statusCode: 404, message: '
              'Failed to load restaurants)',
            ),
          ),
        ),
      );
    });

    test('throws ApiException on error during request', () async {
      when(
        () => mockHttpClient.post(
          Uri.parse(baseUrl),
          headers: headers,
          body: any(named: 'body'),
        ),
      ).thenThrow(Exception('Some error'));

      expect(
        () async => restaurantGqlClient.getRestaurants(),
        throwsA(
          isA<ApiException>().having(
            (e) => e.toString(),
            'toString',
            contains(
              'ApiException(statusCode: 500, message: An unexpected error '
              'occurred: Exception: Some error)',
            ),
          ),
        ),
      );
    });
  });
}
