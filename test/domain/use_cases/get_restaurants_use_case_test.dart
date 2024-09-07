import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';

import '../../fakes/repositories/fake_restaurants_repository.dart';

void main() {
  late GetRestaurantsUseCase getRestaurantsUseCase;
  late FakeRestaurantsRepository fakeRestaurantsRepository;

  setUp(() {
    fakeRestaurantsRepository = FakeRestaurantsRepository();
    getRestaurantsUseCase = GetRestaurantsUseCase(
      restaurantsRepository: fakeRestaurantsRepository,
    );
  });

  test('should get restaurants', () async {
    final data = await getRestaurantsUseCase();

    expect(data?.length, fakeRestaurantsRepository.restaurants.length);
  });
}
