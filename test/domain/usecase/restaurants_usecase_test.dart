import 'package:mockito/mockito.dart';

import 'package:restaurant_tour/domain/repository/restaurants_repository.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/models/restaurant.dart';

import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

import 'restaurants_usecase_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RestaurantsRepository>(),
])
late RestaurantsUsecase usecase;
late RestaurantsRepository repository;

void main() {
  setUpAll(() {
    repository = MockRestaurantsRepository();
    usecase = RestaurantsUsecase(repository);
  });
  test('get restaurants should return a list of restaurants', () async {
    when(repository.getRestaurants()).thenAnswer(
      (_) async => const [Restaurant(id: "123", name: "Unit Test")],
    );
    final result = await usecase.getRestaurants();
    expect(result, isNotEmpty);
    expect(result.first, isA<Restaurant>());
  });

  test('get favorite restaurants should return a list of favoirte restaurants',
      () async {
    when(repository.getFavoriteRestaurants()).thenAnswer(
      (_) async =>
          const [Restaurant(id: "123", name: "Unit Test", isFavorite: true)],
    );
    final result = await usecase.getFavoriteRestaurants();
    expect(result, isNotEmpty);
    expect(result.first, isA<Restaurant>());
    expect(result.first.isFavorite, true);
  });
  test('add favorite restaurant should save a restaurant', () async {
    const testRestaurant = Restaurant(id: 'test_id', name: 'Test Restaurant');
    when(repository.addFavoriteRestaurant(testRestaurant))
        .thenAnswer((_) async => {});
    await usecase.addFavoriteRestaurant(testRestaurant);
    verify(repository.addFavoriteRestaurant(testRestaurant)).called(1);
  });

  test('remove favorite restaurant should delete a restaurant', () async {
    const testRestaurant = Restaurant(id: 'test_id', name: 'Test Restaurant');
    when(repository.removeFavoriteRestaurant(testRestaurant))
        .thenAnswer((_) async => {});
    await usecase.removeFavoriteRestaurant(testRestaurant);
    verify(repository.removeFavoriteRestaurant(testRestaurant)).called(1);
  });

  test('add more favorite restaurant should add more restaurant to the list',
      () async {
    when(repository.getMoreRestaurants(10, 10)).thenAnswer((_) async => {});
    await usecase.loadMoreRestaurants(offset: 10, limit: 10);
    verify(repository.getMoreRestaurants(10, 10)).called(1);
  });
}
