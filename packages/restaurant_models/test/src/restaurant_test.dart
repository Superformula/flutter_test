// ignore_for_file: avoid_dynamic_calls

import 'package:restaurant_models/restaurant_models.dart';
import 'package:test/test.dart';

void main() {
  group('Category', () {
    group('toJson', () {
      test('can be serialized', () {
        final category = Category(alias: 'fast_food', title: 'Fast Food');
        final json = category.toJson();

        expect(json['alias'], category.alias);
        expect(json['title'], category.title);
      });
    });

    group('fromJson', () {
      test('can be deserialized', () {
        final json = {'alias': 'fast_food', 'title': 'Fast Food'};
        final category = Category.fromJson(json);

        expect(category.alias, json['alias']);
        expect(category.title, json['title']);
      });
    });
  });

  group('Hours', () {
    group('toJson', () {
      test('can be serialized', () {
        const hours = Hours(isOpenNow: true);
        final json = hours.toJson();

        expect(json['is_open_now'], hours.isOpenNow);
      });
    });

    group('fromJson', () {
      test('can be deserialized', () {
        final json = {'is_open_now': true};
        final hours = Hours.fromJson(json);

        expect(hours.isOpenNow, json['is_open_now']);
      });
    });
  });

  group('User', () {
    group('toJson', () {
      test('can be serialized', () {
        const user =
            User(id: '123', imageUrl: 'http://image.com', name: 'John');
        final json = user.toJson();

        expect(json['id'], user.id);
        expect(json['image_url'], user.imageUrl);
        expect(json['name'], user.name);
      });
    });

    group('fromJson', () {
      test('can be deserialized', () {
        final json = {
          'id': '123',
          'image_url': 'http://image.com',
          'name': 'John',
        };
        final user = User.fromJson(json);

        expect(user.id, json['id']);
        expect(user.imageUrl, json['image_url']);
        expect(user.name, json['name']);
      });
    });
  });

  group('Review', () {
    group('toJson', () {
      test('can be serialized', () {
        const user =
            User(id: '123', imageUrl: 'http://image.com', name: 'John');
        const review =
            Review(id: 'review123', rating: 5, text: 'Great!', user: user);
        final json = review.toJson();

        expect(json['id'], review.id);
        expect(json['rating'], review.rating);
        expect(json['text'], review.text);
        expect(json['user'], isNotNull);
      });
    });

    group('fromJson', () {
      test('can be deserialized', () {
        final json = {
          'id': 'review123',
          'rating': 5,
          'text': 'Great!',
          'user': {
            'id': '123',
            'image_url': 'http://image.com',
            'name': 'John',
          },
        };
        final review = Review.fromJson(json);

        expect(review.id, json['id']);
        expect(review.rating, json['rating']);
        expect(review.text, json['text']);
        expect(review.user?.id, isNotNull);
      });
    });
  });

  group('Location', () {
    group('toJson', () {
      test('can be serialized', () {
        final location = Location(formattedAddress: '123 Street, City');
        final json = location.toJson();

        expect(json['formatted_address'], location.formattedAddress);
      });
    });

    group('fromJson', () {
      test('can be deserialized', () {
        final json = {'formatted_address': '123 Street, City'};
        final location = Location.fromJson(json);

        expect(location.formattedAddress, json['formatted_address']);
      });
    });
  });

  group('Restaurant', () {
    group('toJson', () {
      test('can be serialized', () {
        final category = Category(alias: 'fast_food', title: 'Fast Food');
        const hours = Hours(isOpenNow: true);
        const user =
            User(id: '123', imageUrl: 'http://image.com', name: 'John');
        const review =
            Review(id: 'review123', rating: 5, text: 'Great!', user: user);
        final location = Location(formattedAddress: '123 Street, City');
        final restaurant = Restaurant(
          id: 'rest123',
          name: 'Restaurant 1',
          price: r'$$',
          rating: 4.5,
          photos: ['http://image.com/photo1'],
          categories: [category],
          hours: [hours],
          reviews: [review],
          location: location,
        );
        final json = restaurant.toJson();

        expect(json['id'], restaurant.id);
        expect(json['name'], restaurant.name);
        expect(json['price'], restaurant.price);
        expect(json['rating'], restaurant.rating);
        expect(json['photos'], isNotNull);
        expect(
          json['categories'],
          isNotEmpty,
        );
        expect(
          json['hours'],
          isNotEmpty,
        );
        expect(json['reviews'], isNotEmpty);
        expect(
          json['location'],
          isNotNull,
        );
      });
    });

    group('fromJson', () {
      test('can be deserialized', () {
        final json = {
          'id': 'rest123',
          'name': 'Restaurant 1',
          'price': r'$$',
          'rating': 4.5,
          'photos': ['http://image.com/photo1'],
          'categories': [
            {'alias': 'fast_food', 'title': 'Fast Food'},
          ],
          'hours': [
            {'is_open_now': true},
          ],
          'reviews': [
            {
              'id': 'review123',
              'rating': 5,
              'text': 'Great!',
              'user': {
                'id': '123',
                'image_url': 'http://image.com',
                'name': 'John',
              },
            }
          ],
          'location': {'formatted_address': '123 Street, City'},
        };
        final restaurant = Restaurant.fromJson(json);

        expect(restaurant.id, json['id']);
        expect(restaurant.name, json['name']);
        expect(restaurant.price, json['price']);
        expect(restaurant.rating, json['rating']);
        expect(restaurant.photos?.first, isNotNull);
        expect(
          restaurant.categories?.first.title,
          isNotNull,
        );
        expect(
          restaurant.hours?.first.isOpenNow,
          isNotNull,
        );
        expect(restaurant.reviews?.first.id, isNotNull);
        expect(
          restaurant.location?.formattedAddress,
          isNotNull,
        );
      });
    });

    test('displayCategory returns correct category', () {
      final category = Category(alias: 'fast_food', title: 'Fast Food');
      final restaurant = Restaurant(categories: [category]);
      expect(restaurant.displayCategory, 'Fast Food');
    });

    test('heroImage returns correct image', () {
      const restaurant = Restaurant(photos: ['http://image.com/photo1']);
      expect(restaurant.heroImage, 'http://image.com/photo1');
    });

    test('isOpen returns correct status', () {
      const hours = Hours(isOpenNow: true);
      const restaurant = Restaurant(hours: [hours]);
      expect(restaurant.isOpen, true);
    });
  });

  group('RestaurantQueryResult', () {
    group('toJson', () {
      test('can be serialized', () {
        const restaurant = Restaurant(id: 'rest123', name: 'Restaurant 1');
        const queryResult =
            RestaurantQueryResult(total: 1, restaurants: [restaurant]);
        final json = queryResult.toJson();

        expect(json['total'], queryResult.total);
        expect(json['business'], isNotNull);
      });
    });

    group('fromJson', () {
      test('can be deserialized', () {
        final json = {
          'total': 1,
          'business': [
            {'id': 'rest123', 'name': 'Restaurant 1'},
          ],
        };
        final queryResult = RestaurantQueryResult.fromJson(json);

        expect(queryResult.total, json['total']);
        expect(
          queryResult.restaurants?.first.id,
          isNotNull,
        );
      });
    });
  });
}
