import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/domain/datasource/favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/domain/repository/restaurants_repository.dart';
import 'package:test/test.dart';

import 'restaurant_respository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RestaurantsDatasource>(),
  MockSpec<FavoriteRestaurantsDatasource>(),
])
void main() {
  group('RestaurantsRepository', () {
    late RestaurantsRepository repository;
    late RestaurantsDatasource mockRestaurantsDatasource;
    late FavoriteRestaurantsDatasource mockFavoritesDatasource;
    List<Restaurant> remoteRestaurants = [
      const Restaurant(id: "restaurant_a", name: 'Restaurant A'),
      const Restaurant(id: "restaurant_b", name: 'Restaurant B'),
    ];
    List<Restaurant> favoriteRestaurants = [
      const Restaurant(
        id: 'restaurant_a',
        name: 'Restaurant A',
        isFavorite: true,
      ),
    ];

    setUp(() {
      mockRestaurantsDatasource = MockRestaurantsDatasource();
      mockFavoritesDatasource = MockFavoriteRestaurantsDatasource();
      repository = RestaurantsRepository(
        mockRestaurantsDatasource,
        mockFavoritesDatasource,
      );
    });

    test('getRestaurants should return restaurant with favorite flag',
        () async {
      // Mock datasource behavior
      when(mockRestaurantsDatasource.getRestaurants())
          .thenAnswer((_) => Future.value(remoteRestaurants));
      when(mockFavoritesDatasource.getFavoritesRestaurants())
          .thenAnswer((_) => Future.value(favoriteRestaurants));

      // Call the method
      final restaurants = await repository.getRestaurants();

      // Assert the result
      expect(restaurants.length, remoteRestaurants.length);
      expect(restaurants.first.isFavorite, true); // Favorited from datasource
    });

    test(
        'getFavoriteRestaurants should empty cache and populates from datasource',
        () async {
      // Mock datasource behavior
      when(mockFavoritesDatasource.getFavoritesRestaurants()).thenAnswer(
        (_) => Future.value([
          const Restaurant(
            id: 'restaurant_a',
            name: 'Restaurant A',
            isFavorite: true,
          ),
        ]),
      );

      // Call the method
      final favoriteRestaurants = await repository.getFavoriteRestaurants();

      // Assert the result
      expect(favoriteRestaurants, favoriteRestaurants);
      expect(favoriteRestaurants.first.isFavorite, true);
    });

    test('addFavoriteRestaurant should adds to cache and datasource', () async {
      const restaurant = Restaurant(id: 'restaurant_b', name: 'Restaurant B');
      // Mock datasource behavior
      when(mockRestaurantsDatasource.getRestaurants())
          .thenAnswer((_) async => remoteRestaurants);
      when(mockFavoritesDatasource.addFavoriteRestaurant(restaurant))
          .thenAnswer((_) => Future.value());
      // Call restaurant to load cache
      await repository.getRestaurants();
      // Call the method
      await repository.addFavoriteRestaurant(restaurant);

      // Verify datasource call
      verify(mockFavoritesDatasource.addFavoriteRestaurant(restaurant));
    });

    test('removeFavoriteRestaurant should remove from cache and datasource',
        () async {
      const restaurant = Restaurant(
        id: 'restaurant_a',
        name: 'Restaurant A',
        isFavorite: true,
      );
      final favoriteList = [restaurant];
      // Mock datasource behavior
      when(mockRestaurantsDatasource.getRestaurants())
          .thenAnswer((_) async => remoteRestaurants);
      when(mockFavoritesDatasource.getFavoritesRestaurants())
          .thenAnswer((_) async => favoriteList);
      when(mockFavoritesDatasource.removeFavoriteRestaurant(restaurant))
          .thenAnswer((_) => Future.value());

      // Call the method
      await repository.getRestaurants();
      await repository.removeFavoriteRestaurant(restaurant);
      //Clear favorite list
      favoriteList.clear();

      final restaurantsResult = await repository.getRestaurants();
      final favoritesResult = await repository.getFavoriteRestaurants();

      // Assert
      expect(favoritesResult.contains(restaurant), false);
      expect(
        restaurantsResult.firstWhere((r) => r.id == restaurant.id).isFavorite,
        false,
      );

      // Verify datasource call
      verify(mockFavoritesDatasource.removeFavoriteRestaurant(restaurant));
    });
  });
}
