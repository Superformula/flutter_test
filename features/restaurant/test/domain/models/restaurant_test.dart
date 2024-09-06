import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../mocks/server_responses.dart';

void main() {
  group('Restaurant Model', () {
    test(
        'Given valid JSON, when Restaurant is created using fromJson, then it should parse and assign values correctly',
        () {
      final restaurant = Restaurant.fromJson(mockedRestaurant());

      expect(restaurant.id, 'faPVqws-x-5109203');
      expect(restaurant.name, 'Southern Bar');
      expect(restaurant.price, '\$\$');
      expect(restaurant.rating, 4.5);
      expect(restaurant.photos, isNotNull);
      expect(restaurant.photos!.first, '');
      expect(restaurant.location.formattedAddress,
          '102 Lakeside Ave Seattle, WA 98122');
      expect(restaurant.reviews.length, 2);
      expect(restaurant.reviews.first.id, 'sjZoO8wcK1NeGJFDk5i82Q');
      expect(restaurant.reviews.first.user.name.fullName, 'Gina T.');
      expect(restaurant.reviews.first.user.name.initials, 'GT');
    });

    test('Given a restaurant when it is open then must create right status',
        () {
      final restaurant = Restaurant.fromJson(mockedRestaurant(isOpen: true));

      expect(restaurant.status, 'Open');
      expect(restaurant.statusColor, AppColors.open);
    });

    test('Given a restaurant when it is not open then must create right status',
        () {
      final restaurant = Restaurant.fromJson(mockedRestaurant(isOpen: false));

      expect(restaurant.status, 'Closed');
      expect(restaurant.statusColor, AppColors.red);
    });
  });
}
