import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:restaurant_tour/core/domain/error/data_error.dart';
import 'package:restaurant_tour/core/domain/error/error.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/presentation/screens/home/_tabs/all_restaurants_tab/bloc/all_restaurants_tab_bloc.dart';

import '../../../../../../fakes/repositories/fake_restaurants_repository.dart';

// I'm implementing a fake use case to test the error case
// This is just an example, we could create it in a separate file and share it with other tests
class FakeGetRestaurantsUseCaseWithError implements GetRestaurantsUseCase {
  const FakeGetRestaurantsUseCaseWithError();

  @override
  Future<Result<List<Restaurant>, BaseError>> call() {
    return Future.value(
      Result<List<Restaurant>, BaseError>.error(UnknownError()),
    );
  }
}

void main() {
  group(
    AllRestaurantsTabBloc,
    () {
      late AllRestaurantsTabBloc bloc;
      late GetRestaurantsUseCase getRestaurantsUseCase;
      late BaseRestaurantsRepository restaurantsRepository;

      setUp(
        () {
          restaurantsRepository = FakeRestaurantsRepository();
          getRestaurantsUseCase = GetRestaurantsUseCase(
            restaurantsRepository: restaurantsRepository,
          );
          bloc = AllRestaurantsTabBloc(
            getRestaurantsUseCase: getRestaurantsUseCase,
          );
        },
      );

      test(
        'test the initial state',
        () {
          expect(bloc.state, const AllRestaurantsTabState());
        },
      );

      blocTest(
        'emits the restaurants list when LoadAllRestaurants is added',
        build: () => bloc,
        act: (bloc) => bloc.add(const LoadAllRestaurants()),
        expect: () async {
          final data = await restaurantsRepository.getRestaurants();
          final expected = data.getOrThrow();
          return [
            AllRestaurantsTabState(
              restaurants: expected,
              contentIsLoading: false,
            ),
          ];
        },
      );

      blocTest(
        'emits an error when LoadAllRestaurants is added',
        build: () => AllRestaurantsTabBloc(
          getRestaurantsUseCase: const FakeGetRestaurantsUseCaseWithError(),
        ),
        act: (bloc) => bloc.add(const LoadAllRestaurants()),
        expect: () async {
          return [
            AllRestaurantsTabState(
              error: UnknownError(),
              contentIsLoading: false,
            ),
          ];
        },
      );
    },
  );
}
