// ignore_for_file: empty_catches

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/http_service/http_client.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/data/repositories/yelp_repository.dart';

class MockYelpRepository extends Mock implements YelpRepository {}

class MockIHttpClient extends Mock implements IHttpClient {}

late YelpRepository repository;
late IHttpClient client;

void main() {
  setUp(() {
    repository = MockYelpRepository();
    client = MockIHttpClient();
  });

  test('Verify if function get restaurants is being called', () async {
    try {
      await repository.getRestaurants();
    } catch (e) {}

    verify(() => repository.getRestaurants()).called(1);
  });

  test('Verify is returning correct data after status 200', () async {
    try {
      when(() => repository.getRestaurants()).thenAnswer(
        (_) async => Some(
          RestaurantQueryResult.fromJson(
            _mockResponseBody,
          ),
        ),
      );
    } catch (e) {}

    when(() => client.get(any())).thenAnswer(
      (_) async => Future.value(
        HttpResponse(
          statusCode: 200,
          body: _mockResponseBody.toString(),
        ),
      ),
    );
    final result = await repository.getRestaurants();

    expect(result, isA<Some>());
  });

  group('Repository errors', () {
    test('Error when api return is an empty map', () async {
      try {
        when(() => repository.getRestaurants())
            .thenAnswer((_) async => const None());
      } catch (e) {}

      when(() => client.get(any())).thenAnswer(
        (_) async => Future.value(
          HttpResponse(
            statusCode: 400,
            body: _mockResponseBody.toString(),
          ),
        ),
      );
      final result = await repository.getRestaurants();

      expect(result, isA<None>());
    });

    test('Error when api exception', () async {
      when(() => client.get(any())).thenThrow(Exception('API error'));
      when(() => repository.getRestaurants())
          .thenAnswer((_) async => const None());

      final result = await repository.getRestaurants();

      expect(result, const None());
    });
  });
}

final _mockResponseBody = {
  "data": {
    "search": {
      "total": 7520,
      "business": [
        {
          "id": "vHz2RLtfUMVRPFmd7VBEHA",
          "name": "Gordon Ramsay Hell's Kitchen",
          "price": "\$\$\$",
          "rating": 4.4,
          "photos": [
            "https://s3-media2.fl.yelpcdn.com/bphoto/q771KjLzI5y638leJsnJnQ/o.jpg",
          ],
          "reviews": [
            {
              "id": "F88H5ow44AmiwisbrbswPw",
              "rating": 5,
              "text":
                  "This entire experience is always so amazing. Every single dish is cooked to perfection. Every beef dish was so tender. The desserts were absolutely...",
              "user": {
                "id": "y742Fi1jF_JAqq5sRUlLEw",
                "image_url":
                    "https://s3-media2.fl.yelpcdn.com/photo/rEWek1sYL0F35KZ0zRt3sw/o.jpg",
                "name": "Ashley L.",
              },
            },
            {
              "id": "VJCoQlkk4Fjac0OPoRP8HQ",
              "rating": 5,
              "text":
                  "Me and my husband came to celebrate my birthday here and it was a 10/10 experience. Firstly, I booked the wrong area which was the Gordon Ramsay pub and...",
              "user": {
                "id": "0bQNLf0POLTW4VhQZqOZoQ",
                "image_url":
                    "https://s3-media3.fl.yelpcdn.com/photo/i_0K5RUOQnoIw1c4QzHmTg/o.jpg",
                "name": "Glydel L.",
              },
            },
            {
              "id": "EeCKH7eUVDsZv0Ii9wcPiQ",
              "rating": 5,
              "text":
                  "phenomenal! Bridgette made our experience as superb as the food coming to the table! would definitely come here again and try everything else on the menu,...",
              "user": {
                "id": "gL7AGuKBW4ne93_mR168pQ",
                "image_url":
                    "https://s3-media1.fl.yelpcdn.com/photo/iU1sA7y3dEEc4iRL9LnWQQ/o.jpg",
                "name": "Sydney O.",
              },
            }
          ],
          "categories": [
            {
              "title": "New American",
              "alias": "newamerican",
            },
            {
              "title": "Seafood",
              "alias": "seafood",
            }
          ],
          "hours": [
            {
              "is_open_now": true,
            }
          ],
          "location": {
            "formatted_address": "3570 Las Vegas Blvd S\nLas Vegas, NV 89109",
          },
        },
      ],
    },
  },
};
