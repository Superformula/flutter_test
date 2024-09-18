import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/modules/home/bloc/home_bloc.dart';
import 'package:restaurant_tour/modules/home/repository/home_repository.dart';

class MockHomeRepository extends Mock implements HomeRepository {
  @override
  Future<List<Restaurant>> getRestaurants({int offset = 0}) {
    return Future.value([]);
  }

  @override
  Future<List<Restaurant>> getFavoriteRestaurants() {
    return Future.value([]);
  }
}

class MockHomeRepositoryWithError extends Mock implements HomeRepository {
  @override
  Future<List<Restaurant>> getRestaurants({int offset = 0}) {
    return Future.error(Error());
  }

  @override
  Future<List<Restaurant>> getFavoriteRestaurants() {
    return Future.error(Error());
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'homeBlocTest',
    () {
      late MockHomeRepository mockHomeRepository;
      late MockHomeRepositoryWithError mockHomeRepositoryWithError;

      setUp(
        () => {
          mockHomeRepository = MockHomeRepository(),
          mockHomeRepositoryWithError = MockHomeRepositoryWithError(),
        },
      );

      blocTest<HomeBloc, HomeState>(
        'should emit LoadedRestaurantsState when LoadRestaurantsEvent is called and onlyFavorites is false',
        build: () => HomeBloc(
          homeRepository: mockHomeRepository,
        ),
        act: (bloc) => bloc.add(
          const LoadRestaurantsEvent(),
        ),
        expect: () => [
          isA<LoadingRestaurantsState>(),
          isA<LoadedRestaurantsState>(),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'should emit LoadedRestaurantsState when LoadRestaurantsEvent is called and onlyFavorites is true',
        build: () => HomeBloc(
          homeRepository: mockHomeRepository,
        ),
        act: (bloc) => bloc.add(
          const LoadRestaurantsEvent(onlyFavorites: true),
        ),
        expect: () => [
          isA<LoadingRestaurantsState>(),
          isA<LoadedRestaurantsState>(),
        ],
      );

      blocTest<HomeBloc, HomeState>(
        'should emit ErrorLoadRestaurantsState when LoadRestaurantsEvent is called',
        build: () => HomeBloc(
          homeRepository: mockHomeRepositoryWithError,
        ),
        act: (bloc) => bloc.add(
          const LoadRestaurantsEvent(),
        ),
        expect: () => [
          isA<LoadingRestaurantsState>(),
          isA<ErrorLoadRestaurantsState>(),
        ],
      );
    },
  );
}
