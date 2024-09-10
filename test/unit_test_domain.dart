import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/models/restaurant.dart';

void main() {
  group('Restaurant Model', () {
    test('Category to/from JSON', () {
      final category = Category(alias: 'italian', title: 'Italian');
      final json = category.toJson();
      final fromJson = Category.fromJson(json);

      expect(fromJson.alias, equals('italian'));
      expect(fromJson.title, equals('Italian'));
    });

    test('Hours to/from JSON', () {
      final hours = Hours(isOpenNow: true);
      final json = hours.toJson();
      final fromJson = Hours.fromJson(json);

      expect(fromJson.isOpenNow, equals(true));
    });

    test('User to/from JSON', () {
      final user = User(id: '123', imageUrl: 'http://example.com', name: 'John Doe');
      final json = user.toJson();
      final fromJson = User.fromJson(json);

      expect(fromJson.id, equals('123'));
      expect(fromJson.imageUrl, equals('http://example.com'));
      expect(fromJson.name, equals('John Doe'));
    });

    test('Review to/from JSON', () {
      final user = User(id: '123', imageUrl: 'http://example.com', name: 'John Doe');
      final review = Review(id: 'review1', rating: 5, text: 'Great place!', user: user);
      final json = review.toJson();
      final fromJson = Review.fromJson(json);

      expect(fromJson.id, equals('review1'));
      expect(fromJson.rating, equals(5));
      expect(fromJson.text, equals('Great place!'));
      expect(fromJson.user!.id, equals('123'));
    });

    test('Location to/from JSON', () {
      final location = Location(formattedAddress: '123 Main St, City, Country');
      final json = location.toJson();
      final fromJson = Location.fromJson(json);

      expect(fromJson.formattedAddress, equals('123 Main St, City, Country'));
    });

    test('Restaurant to/from JSON', () {
      final restaurant = Restaurant(
        id: 'restaurant1',
        name: 'Best Restaurant',
        price: '\$\$',
        rating: 4.5,
        photos: ['https://example.com/photo1.jpg'],
        categories: [Category(alias: 'italian', title: 'Italian')],
        hours: [Hours(isOpenNow: true)],
        reviews: [
          Review(id: 'review1', rating: 5, text: 'Great place!', user: User(id: '123', imageUrl: 'http://example.com', name: 'John Doe')),
        ],
        location: Location(formattedAddress: '123 Main St, City, Country'),
      );

      final json = restaurant.toJson();
      final fromJson = Restaurant.fromJson(json);

      expect(fromJson.id, equals('restaurant1'));
      expect(fromJson.name, equals('Best Restaurant'));
      expect(fromJson.price, equals('\$\$'));
      expect(fromJson.rating, equals(4.5));
      expect(fromJson.photos!.first, equals('https://example.com/photo1.jpg'));
      expect(fromJson.categories!.first.title, equals('Italian'));
      expect(fromJson.hours!.first.isOpenNow, equals(true));
      expect(fromJson.reviews!.first.text, equals('Great place!'));
      expect(fromJson.location!.formattedAddress, equals('123 Main St, City, Country'));
    });

    test('RestaurantQueryResult to/from JSON', () {
      final restaurant = Restaurant(
        id: 'restaurant1',
        name: 'Best Restaurant',
        price: '\$\$',
        rating: 4.5,
      );
      final queryResult = RestaurantQueryResult(
        total: 100,
        restaurants: [restaurant],
      );

      final json = queryResult.toJson();
      final fromJson = RestaurantQueryResult.fromJson(json);

      expect(fromJson.total, equals(100));
      expect(fromJson.restaurants!.first.name, equals('Best Restaurant'));
    });

    test('Restaurant utility methods', () {
      final restaurant = Restaurant(
        id: 'restaurant1',
        name: 'Best Restaurant',
        price: '\$\$',
        rating: 4.5,
        categories: [Category(alias: 'italian', title: 'Italian')],
        photos: ['https://example.com/photo1.jpg'],
        hours: [Hours(isOpenNow: true)],
      );

      expect(restaurant.displayCategory, equals('Italian'));
      expect(restaurant.heroImage, equals('https://example.com/photo1.jpg'));
      expect(restaurant.isOpen, equals(true));
    });
  });
}
