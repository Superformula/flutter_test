import 'package:flutter_test/flutter_test.dart';

import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import '../../fakes/repositories/fake_restaurants_repository.dart';

void main() {
  late GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase;
  late FakeRestaurantsRepository fakeRestaurantsRepository;

  setUp(() {
    fakeRestaurantsRepository = FakeRestaurantsRepository();
    getFavoriteRestaurantsUseCase = GetFavoriteRestaurantsUseCase(
      restaurantsRepository: fakeRestaurantsRepository,
    );
  });

  test('should return a stream of favorite restaurants', () {
    expectLater(
      getFavoriteRestaurantsUseCase(),
      emitsInOrder([fakeRestaurantsRepository.favoriteRestaurants]),
    );
  });
}
