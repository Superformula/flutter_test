import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/viewmodels/yelp_detail_viewmodel.dart';

void main() {
  late YelpDetailViewModel viewModel;

  setUp(() {
    viewModel = YelpDetailViewModel();
  });

  group('YelpDetailViewModel Tests', () {
    test('Initially, selected restaurant should be null', () {
      expect(viewModel.selectedRestaurant, isNull);
    });

    test('selectRestaurant should correctly set the selected restaurant', () {
      final restaurant = Restaurant(
        name: 'Test Restaurant',
        price: '\$\$',
        rating: 4.5,
        photos: ['test_photo.jpg'],
      );

      viewModel.selectRestaurant(restaurant);

      expect(viewModel.selectedRestaurant, isNotNull);
      expect(viewModel.selectedRestaurant!.name, 'Test Restaurant');
    });

    test('selectRestaurant should replace the previously selected restaurant', () {
      final restaurant1 = Restaurant(
        name: 'Restaurant 1',
        price: '\$\$',
        rating: 4.5,
        photos: ['photo1.jpg'],
      );
      final restaurant2 = Restaurant(
        name: 'Restaurant 2',
        price: '\$\$\$',
        rating: 4.0,
        photos: ['photo2.jpg'],
      );

      viewModel.selectRestaurant(restaurant1);
      expect(viewModel.selectedRestaurant!.name, 'Restaurant 1');

      viewModel.selectRestaurant(restaurant2);
      expect(viewModel.selectedRestaurant!.name, 'Restaurant 2');
    });

    test('clearSelection should set selected restaurant to null', () {
      final restaurant = Restaurant(
        name: 'Test Restaurant',
        price: '\$\$',
        rating: 4.5,
        photos: ['test_photo.jpg'],
      );

      viewModel.selectRestaurant(restaurant);
      expect(viewModel.selectedRestaurant, isNotNull);

      viewModel.clearSelection();
      expect(viewModel.selectedRestaurant, isNull);
    });
  });
}