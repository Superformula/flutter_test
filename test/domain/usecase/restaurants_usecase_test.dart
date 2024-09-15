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

  test('get restaurant should return a restaurant model', () async {
    when(repository.getRestaurant('test')).thenAnswer(
      (_) async => const Restaurant(
        id: 'test',
        name: 'Test unit',
      ),
    );
    final result = await usecase.getRestaurant('test');
    expect(result, isA<Restaurant>());
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
    when(repository.addFavoriteRestaurant(testRestaurant))
        .thenAnswer((_) async => {});
    await usecase.removeFavoriteRestaurant(testRestaurant);
    verify(repository.removeFavoriteRestaurant(testRestaurant)).called(1);
  });
}
