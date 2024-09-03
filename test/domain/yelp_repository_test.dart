import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

import 'yelp_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late YelpRepository yelpRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    yelpRepository = YelpRepository();
  });

  group('YelpRepository', () {
    test('should return RestaurantQueryResult on a successful response',
        () async {
      final mockResponseData = {
        "data": {
          "search": {
            "total": 1,
            "business": [
              {
                "id": "test_id",
                "name": "Test Restaurant",
                "price": "\$\$",
                "rating": 4.5,
                "photos": ["https://test.com/photo.jpg"],
                "reviews": [
                  {
                    "id": "review_id",
                    "rating": 5,
                    "user": {
                      "id": "user_id",
                      "image_url": "https://test.com/user.jpg",
                      "name": "Test User",
                    },
                    "text": "Great place!",
                  }
                ],
              }
            ]
          }
        }
      };

      when(mockDio.post<Map<String, dynamic>>(
        any,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response<Map<String, dynamic>>(
            data: mockResponseData,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ));

      final result = await yelpRepository.getRestaurants();

      expect(result, isA<RestaurantQueryResult>());
      expect(result!.total, 1);
      expect(result.restaurants![0].id, 'test_id');
    });
  });
}
