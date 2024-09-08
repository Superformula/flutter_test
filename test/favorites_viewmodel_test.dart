import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/database/db_helper.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/viewmodels/favorites_viewmodel.dart';
import 'favorites_viewmodel_test.mocks.dart';
import 'yelp_list_viewmodel_tests.mocks.dart';

@GenerateMocks([DBHelper])
void main() {
  late FavoritesViewModel favoritesViewModel;
  late MockDBHelper mockDBHelper;
  late MockYelpRepository mockYelpRepository;

  setUp(() {
    mockDBHelper = MockDBHelper();
    mockYelpRepository = MockYelpRepository();
    favoritesViewModel = FavoritesViewModel(dbHelper: mockDBHelper, yelpRepository: mockYelpRepository);
  });

  group('FavoritesViewModel', () {
    test('fetches favorite restaurants from DB and Yelp', () async {
      final favoriteIds = ['1', '2'];
      final mockRestaurant1 = Restaurant(id: '1', name: 'Mock Restaurant 1');
      final mockRestaurant2 = Restaurant(id: '2', name: 'Mock Restaurant 2');

      when(mockDBHelper.getFavorites()).thenAnswer((_) async => favoriteIds);

      when(mockYelpRepository.getRestaurantsByIds(['1', '2']))
          .thenAnswer((_) async => [mockRestaurant1, mockRestaurant2]);

      await favoritesViewModel.fetchFavorites();

      expect(favoritesViewModel.favoriteRestaurants.length, 2);
      expect(favoritesViewModel.favoriteRestaurants[0].name, 'Mock Restaurant 1');
      expect(favoritesViewModel.favoriteRestaurants[1].name, 'Mock Restaurant 2');
    });

    test('handles empty favorite list', () async {
      when(mockDBHelper.getFavorites()).thenAnswer((_) async => []);

      when(mockYelpRepository.getRestaurantsByIds([])).thenAnswer((_) async => []);

      await favoritesViewModel.fetchFavorites();

      expect(favoritesViewModel.favoriteRestaurants.isEmpty, true);
    });

    test('adds a restaurant to favorites', () async {
      final restaurantId = '1';
      final mockRestaurant = Restaurant(id: restaurantId, name: 'Mock Restaurant');

      when(mockDBHelper.insertFavorite(restaurantId)).thenAnswer((_) async {});

      when(mockYelpRepository.getRestaurantsByIds([restaurantId]))
          .thenAnswer((_) async => [mockRestaurant]);

      await favoritesViewModel.addFavorite(restaurantId);

      expect(favoritesViewModel.favoriteRestaurants.length, 1);
      expect(favoritesViewModel.favoriteRestaurants[0].name, 'Mock Restaurant');
    });

    test('removes a restaurant from favorites', () async {
      final restaurantId = '1';
      final mockRestaurant = Restaurant(id: restaurantId, name: 'Mock Restaurant');

      favoritesViewModel.favoriteRestaurants.add(mockRestaurant);
      when(mockDBHelper.deleteFavorite(restaurantId)).thenAnswer((_) async {});

      await favoritesViewModel.removeFavorite(restaurantId);

      expect(favoritesViewModel.favoriteRestaurants.isEmpty, true);
    });

    test('checks if a restaurant is a favorite', () async {
      final restaurantId = '1';
      when(mockDBHelper.isFavorite(restaurantId)).thenAnswer((_) async => true);

      final isFavorite = await favoritesViewModel.isFavorite(restaurantId);

      expect(isFavorite, true);
    });
  });
}
