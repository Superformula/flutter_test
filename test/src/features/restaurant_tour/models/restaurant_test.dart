import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

void main() {
  group('Category', () {
    test('fromJson and toJson should work correctly', () {
      final json = {'alias': 'mex', 'title': 'Mexican'};
      final category = Category.fromJson(json);
      expect(category.alias, 'mex');
      expect(category.title, 'Mexican');
      expect(category.toJson(), json);
    });
  });

  group('Hours', () {
    test('fromJson and toJson should work correctly', () {
      final json = {'is_open_now': true};
      final hours = Hours.fromJson(json);
      expect(hours.isOpenNow, true);
      expect(hours.toJson(), json);
    });
  });

  group('User', () {
    test('fromJson and toJson should work correctly', () {
      final json = {
        'id': 'user1',
        'image_url': 'http://example.com/img.jpg',
        'name': 'John Doe',
      };
      final user = User.fromJson(json);
      expect(user.id, 'user1');
      expect(user.imageUrl, 'http://example.com/img.jpg');
      expect(user.name, 'John Doe');
      expect(user.toJson(), json);
    });
  });

  group('Review', () {
    test('fromJson and toJson should work correctly', () {
      final json = {
        'id': 'review1',
        'rating': 5,
        'text': 'Great place!',
        'user': {
          'id': 'user1',
          'image_url': 'http://example.com/img.jpg',
          'name': 'John Doe',
        },
      };
      final review = Review.fromJson(json);
      expect(review.id, 'review1');
      expect(review.rating, 5);
      expect(review.user?.id, 'user1');
      expect(review.user?.imageUrl, 'http://example.com/img.jpg');
      expect(review.user?.name, 'John Doe');
    });
  });

  group('Location', () {
    test('fromJson and toJson should work correctly', () {
      final json = {'formatted_address': '123 Main St, Anytown, USA'};
      final location = Location.fromJson(json);
      expect(location.formattedAddress, '123 Main St, Anytown, USA');
      expect(location.toJson(), json);
    });
  });

  group('Restaurant', () {
    test('fromJson and toJson should work correctly', () {
      final json = {
        'id': 'restaurant1',
        'name': 'Test Restaurant',
        'price': '\$\$\$',
        'rating': 4.5,
        'photos': ['http://example.com/photo1.jpg'],
        'categories': [
          {'alias': 'mex', 'title': 'Mexican'},
        ],
        'hours': [
          {'is_open_now': true},
        ],
        'reviews': [
          {
            'id': 'review1',
            'rating': 5,
            'text': 'Great!',
            'user': {'id': 'user1'},
          }
        ],
        'location': {'formatted_address': '123 Main St, Anytown, USA'},
      };
      final restaurant = Restaurant.fromJson(json);
      expect(restaurant.id, 'restaurant1');
      expect(restaurant.name, 'Test Restaurant');
      expect(restaurant.price, '\$\$\$');
      expect(restaurant.rating, 4.5);
      expect(restaurant.photos, ['http://example.com/photo1.jpg']);
      expect(restaurant.categories?.first.alias, 'mex');
      expect(restaurant.categories?.first.title, 'Mexican');
      expect(restaurant.hours?.first.isOpenNow, true);
      expect(restaurant.reviews?.first.id, 'review1');
      expect(restaurant.reviews?.first.rating, 5);
      expect(
        restaurant.location?.formattedAddress,
        '123 Main St, Anytown, USA',
      );
    });

    test('displayCategory should return the first category title', () {
      final restaurant = Restaurant(categories: [Category(title: 'Mexican')]);
      expect(restaurant.displayCategory, 'Mexican');
    });

    test('heroImage should return the first photo URL', () {
      const restaurant = Restaurant(photos: ['http://example.com/photo1.jpg']);
      expect(restaurant.heroImage, 'http://example.com/photo1.jpg');
    });

    test('isOpen should return the status of the first hour', () {
      const restaurant = Restaurant(hours: [Hours(isOpenNow: true)]);
      expect(restaurant.isOpen, true);
    });
    // });

    group('RestaurantQueryResult', () {
      test('fromJson and toJson should work correctly', () {
        final json = {
          'total': 10,
          'business': [
            {'id': 'restaurant1', 'name': 'Test Restaurant'},
          ],
        };
        final result = RestaurantQueryResult.fromJson(json);
        expect(result.total, 10);
        expect(result.restaurants?.first.id, 'restaurant1');
        expect(result.restaurants?.first.name, 'Test Restaurant');
      });
    });
  });
}
