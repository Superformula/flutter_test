import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/presentation/screens/home/bloc/home_bloc.dart';

import '../../../../fakes/repositories/fake_restaurants_repository.dart';

void main() {
  group(
    HomeBloc,
    () {
      late HomeBloc bloc;
      late GetFavoriteRestaurantsUseCase getFavoriteRestaurantsUseCase;
      late BaseRestaurantsRepository restaurantsRepository;

      setUp(
        () {
          restaurantsRepository = FakeRestaurantsRepository();
          getFavoriteRestaurantsUseCase = GetFavoriteRestaurantsUseCase(
              restaurantsRepository: restaurantsRepository);
          bloc = HomeBloc(
              getFavoriteRestaurantsUseCase: getFavoriteRestaurantsUseCase);
        },
      );

      test(
        'test the initial state',
        () {
          expect(bloc.state, const HomeState());
        },
      );

      blocTest(
        'emits the favorites restaurants when LoadFavoriteRestaurants is added',
        build: () => bloc,
        act: (bloc) => bloc.add(const LoadFavoriteRestaurants()),
        expect: () async {
          final expected = await restaurantsRepository.getFavorites().single;
          return [
            HomeState(favoriteRestaurants: expected),
          ];
        },
      );
    },
  );
}
