import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:test/test.dart';

import 'test_favorite_restaurants_bloc.mocks.dart';

@GenerateNiceMocks([MockSpec<RestaurantsUsecase>()])
late RestaurantsUsecase usecase;
late List<Restaurant> testFavoritesRestaurants;
late Restaurant testFavoriteRestaurant;
void main() {
  setUp(() {
    usecase = MockRestaurantsUsecase();
    testFavoriteRestaurant =
        const Restaurant(id: 'test_3', name: 'Test Restaurant');
    testFavoritesRestaurants = [
      const Restaurant(id: 'test_1', name: 'Test Restaurant'),
      const Restaurant(id: 'test_2', name: 'Test Restaurant'),
    ];
  });

  blocTest(
    'FavoritesRestaurantsBloc should load favorite restaurants'
    ' and emit FavoritesRestaurantsReady state',
    setUp: () => when(usecase.getFavoriteRestaurants())
        .thenAnswer((_) async => (testFavoritesRestaurants)),
    build: () => FavoritesRestaurantsBloc(usecase),
    act: (bloc) => bloc.add(LoadFavoritesRestaurants()),
    wait: const Duration(milliseconds: 300),
    expect: () =>
        [isA<FavoritesRestaurantsLoading>(), isA<FavoritesRestaurantsReady>()],
    verify: (bloc) => verify(usecase.getFavoriteRestaurants()).called(1),
  );

  blocTest(
    'FavoritesRestaurantsBloc should load favorite restaurants'
    ' and emit FavoritesRestaurantError state',
    setUp: () => when(usecase.getFavoriteRestaurants())
        .thenThrow(FavoritesRestaurantsListException()),
    build: () => FavoritesRestaurantsBloc(usecase),
    act: (bloc) => bloc.add(LoadFavoritesRestaurants()),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      isA<FavoritesRestaurantsLoading>(),
      isA<FavoriteRestaurantsListError>(),
    ],
    verify: (bloc) => verify(usecase.getFavoriteRestaurants()).called(1),
  );

  blocTest(
    'FavoritesRestaurantsBloc should add a new favorite restaurant'
    ' and return a FavoritesRestaurantsListState',
    setUp: () {
      when(usecase.addFavoriteRestaurant(testFavoriteRestaurant))
          .thenAnswer((_) async {});
      when(usecase.getFavoriteRestaurants())
          .thenAnswer((_) async => testFavoritesRestaurants);
    },
    build: () => FavoritesRestaurantsBloc(usecase),
    act: (bloc) => bloc.add(AddFavoriteRestaurant(testFavoriteRestaurant)),
    wait: const Duration(milliseconds: 300),
    expect: () =>
        [isA<FavoritesRestaurantsLoading>(), isA<FavoritesRestaurantsReady>()],
    verify: (bloc) {
      verify(usecase.getFavoriteRestaurants()).called(1);
      verify(usecase.addFavoriteRestaurant(testFavoriteRestaurant)).called(1);
    },
  );

  blocTest(
    'FavoritesRestaurantsBloc should remove a favorite restaurant'
    ' and return a FavoritesRestaurantsListState',
    setUp: () {
      when(usecase.removeFavoriteRestaurant(testFavoriteRestaurant))
          .thenAnswer((_) async {});
      when(usecase.getFavoriteRestaurants())
          .thenAnswer((_) async => testFavoritesRestaurants);
    },
    build: () => FavoritesRestaurantsBloc(usecase),
    act: (bloc) => bloc.add(RemoveFavoriteRestaurant(testFavoriteRestaurant)),
    wait: const Duration(milliseconds: 300),
    expect: () =>
        [isA<FavoritesRestaurantsLoading>(), isA<FavoritesRestaurantsReady>()],
    verify: (bloc) {
      verify(usecase.removeFavoriteRestaurant(testFavoriteRestaurant))
          .called(1);
      verify(usecase.getFavoriteRestaurants()).called(1);
    },
  );
}
