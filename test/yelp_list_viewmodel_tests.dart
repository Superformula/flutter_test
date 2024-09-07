import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'package:restaurant_tour/viewmodels/yelp_list_viewmodel.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'yelp_list_viewmodel_tests.mocks.dart';

@GenerateMocks([YelpRepository])
void main() {
  late YelpListViewModel viewModel;
  late MockYelpRepository mockYelpRepository;

  setUp(() {
    mockYelpRepository = MockYelpRepository();
    viewModel = YelpListViewModel(repository: mockYelpRepository);
  });

  group('YelpListViewModel Tests', () {
    test('Initially, isLoading should be false', () {
      expect(viewModel.isLoading, false);
    });

    test('Initially, restaurants should be an empty list', () {
      expect(viewModel.restaurants, []);
    });

    test('fetchYelpItems should set isLoading to true, then false after fetching', () async {
      when(mockYelpRepository.getRestaurants()).thenAnswer((_) async {
        await Future.delayed(Duration(milliseconds: 100));
        return RestaurantQueryResult(
          restaurants: [
            Restaurant(name: 'Restaurant 1', price: '\$\$', rating: 4.5, photos: ['photo1.jpg']),
            Restaurant(name: 'Restaurant 2', price: '\$\$\$', rating: 4.0, photos: ['photo2.jpg']),
          ],
        );
      });

      expect(viewModel.isLoading, false);
      final fetchFuture = viewModel.fetchYelpItems();
      expect(viewModel.isLoading, true);

      await fetchFuture;
      expect(viewModel.isLoading, false);
      expect(viewModel.restaurants.length, 2);
      expect(viewModel.restaurants[0].name, 'Restaurant 1');
    });

    test('fetchYelpItems should handle errors gracefully', () async {
      when(mockYelpRepository.getRestaurants()).thenThrow(Exception('Failed to fetch'));

      await viewModel.fetchYelpItems();

      expect(viewModel.isLoading, false);
      expect(viewModel.restaurants.isEmpty, true);
    });

    test('fetchYelpItems should not fetch data again if already fetched', () async {
      when(mockYelpRepository.getRestaurants()).thenAnswer((_) async {
        return RestaurantQueryResult(
          restaurants: [
            Restaurant(name: 'Restaurant 1', price: '\$\$', rating: 4.5, photos: ['photo1.jpg']),
          ],
        );
      });

      await viewModel.fetchYelpItems();
      expect(viewModel.restaurants.length, 1);

      await viewModel.fetchYelpItems();
      verify(mockYelpRepository.getRestaurants()).called(1);
    });

    test('refreshYelpItems should force a refresh even if already fetched', () async {
      when(mockYelpRepository.getRestaurants()).thenAnswer((_) async {
        return RestaurantQueryResult(
          restaurants: [
            Restaurant(name: 'Restaurant 1', price: '\$\$', rating: 4.5, photos: ['photo1.jpg']),
          ],
        );
      });

      await viewModel.fetchYelpItems();
      expect(viewModel.restaurants.length, 1);

      await viewModel.refreshYelpItems();
      verify(mockYelpRepository.getRestaurants()).called(2);
    });
  });
}