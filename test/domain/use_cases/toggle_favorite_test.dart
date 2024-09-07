import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';

import '../../fakes/repositories/fake_restaurants_repository.dart';

void main() {
  late ToggleFavoriteUseCase toggleFavoriteUseCase;
  late GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase;
  late FakeRestaurantsRepository fakeRestaurantsRepository;

  setUp(() {
    fakeRestaurantsRepository = FakeRestaurantsRepository();
    toggleFavoriteUseCase = ToggleFavoriteUseCase(
      restaurantsRepository: fakeRestaurantsRepository,
    );
    getFavoriteRestaurantsUseCase = GetFavoriteRestaurantsUseCase(
      restaurantsRepository: fakeRestaurantsRepository,
    );
  });

  test('should remove a restaurant from favorites', () async {
    final favoriteRestaurants =
        List.of(fakeRestaurantsRepository.favoriteRestaurants);

    toggleFavoriteUseCase(favoriteRestaurants.first);

    favoriteRestaurants
        .removeWhere((element) => element.id == favoriteRestaurants.first.id);

    expectLater(
      getFavoriteRestaurantsUseCase(),
      emitsInOrder([favoriteRestaurants]),
    );
  });

  test('should add a restaurant to favorites', () async {
    final newFavoriteRestaurant = fakeRestaurantsRepository.restaurants.last;
    final favoriteRestaurants =
        List.of(fakeRestaurantsRepository.favoriteRestaurants);
    favoriteRestaurants.add(newFavoriteRestaurant);

    toggleFavoriteUseCase(newFavoriteRestaurant);

    expectLater(
      getFavoriteRestaurantsUseCase(),
      emitsInOrder([favoriteRestaurants]),
    );
  });
}
