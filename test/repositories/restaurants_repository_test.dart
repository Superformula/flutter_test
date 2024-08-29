import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';

void main() {
  late Dio mockDio;
  late Response<Map<String, Object?>> mockResponse;
  late RestaurantsRepository repository;

  setUp(() {
    mockDio = MockDio();
    mockResponse = MockResponse();
    repository = HttpRestaurantsRepository(dio: mockDio);
  });

  test('The Yelp HTTP repository should parse correctly the returned JSON', () async {
    when(() => mockResponse.data).thenReturn(_mockJson);
    when(
      () {
        return mockDio.post<Map<String, Object?>>(
          '/v3/graphql',
          data: any(named: 'data'),
        );
      },
    ).thenAnswer((invocation) async => mockResponse);

    await expectLater(
      repository.getRestaurants(),
      completion(_mockQueryResult),
    );
  });
}

const _mockJson = {
  'data': {
    'search': {
      'total': 1,
      'business': [
        {
          'id': 'business_id',
          'name': 'Restaurant name',
          'price': r'$$$$',
          'rating': 4.0,
          'photos': ['photo'],
          'reviews': [
            {
              'id': 'review_id',
              'rating': 4,
              'text': 'review text',
              'user': {
                'id': 'user_id',
                'image_url': 'image_url',
                'name': 'Name',
              },
            },
          ],
          'categories': [
            {'title': 'Test', 'alias': 'test'},
          ],
          'hours': [
            {'is_open_now': false},
          ],
          'location': {
            'formatted_address': 'formatted address',
          },
        }
      ],
    },
  },
};

const _mockQueryResult = RestaurantQueryResult(
  total: 1,
  restaurants: [
    Restaurant(
      id: 'business_id',
      name: 'Restaurant name',
      price: r'$$$$',
      rating: 4.0,
      photos: ['photo'],
      reviews: [
        Review(
          id: 'review_id',
          rating: 4,
          text: 'review text',
          user: User(
            id: 'user_id',
            imageUrl: 'image_url',
            name: 'Name',
          ),
        ),
      ],
      categories: [
        Category(
          title: 'Test',
          alias: 'test',
        ),
      ],
      hours: [
        Hours(open: false),
      ],
      location: Location(
        formattedAddress: 'formatted address',
      ),
    ),
  ],
);

final class MockDio extends Mock implements Dio {}

final class MockResponse<T> extends Mock implements Response<T> {}
