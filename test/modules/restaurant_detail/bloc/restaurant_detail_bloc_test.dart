import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/modules/restaurant_detail/bloc/restaurant_detail_bloc.dart';
import 'package:restaurant_tour/modules/restaurant_detail/models/detail_page_arguments.dart';
import 'package:restaurant_tour/modules/restaurant_detail/restaurant_detail_repository.dart';

class MockRestaurantDetailRepository extends Mock
    implements RestaurantDetailRepository {
  @override
  Future<void> addRestaurant({required Restaurant restaurant}) {
    return Future.value();
  }

  @override
  Future<void> deleteRestaurant({required String restaurantId}) {
    return Future.value();
  }
}

class MockRestaurantDetailRepositoryWithError extends Mock
    implements RestaurantDetailRepository {
  @override
  Future<void> addRestaurant({required Restaurant restaurant}) {
    return Future.error(Error());
  }

  @override
  Future<void> deleteRestaurant({required String restaurantId}) {
    return Future.error(Error());
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    'restaurantDetailBlocTest',
    () {
      late MockRestaurantDetailRepository mockRestaurantDetailRepository;
      late MockRestaurantDetailRepositoryWithError
          mockRestaurantDetailRepositoryWithError;

      setUp(
        () => {
          mockRestaurantDetailRepository = MockRestaurantDetailRepository(),
          mockRestaurantDetailRepositoryWithError =
              MockRestaurantDetailRepositoryWithError(),
        },
      );

      blocTest<RestaurantDetailBloc, RestaurantDetailState>(
        'should emit LoadedDetailState when LoadDetailEvent is called',
        build: () => RestaurantDetailBloc(
          restaurantDetailRepository: mockRestaurantDetailRepository,
        ),
        act: (bloc) => bloc.add(
          LoadDetailEvent(
            detailPageArgurments: DetailPageArgurments(
              restaurant: const Restaurant(),
              isFromFavorite: true,
            ),
          ),
        ),
        expect: () => [
          isA<LoadingDetailState>(),
          isA<LoadedDetailState>(),
        ],
      );

      blocTest<RestaurantDetailBloc, RestaurantDetailState>(
        'should emit ErrorLoadDetailState when LoadDetailEvent is called',
        build: () => RestaurantDetailBloc(
          restaurantDetailRepository: mockRestaurantDetailRepository,
        ),
        act: (bloc) => bloc.add(
          const LoadDetailEvent(),
        ),
        expect: () => [
          isA<LoadingDetailState>(),
          isA<ErrorLoadDetailState>(),
        ],
      );

      blocTest<RestaurantDetailBloc, RestaurantDetailState>(
        'should emit LoadedSetFavoriteState when SetFavoriteEvent is called and isFavorite is true',
        build: () => RestaurantDetailBloc(
          restaurantDetailRepository: mockRestaurantDetailRepository,
        ),
        seed: () => const RestaurantDetailInitialState(
          Model(
            restaurant: Restaurant(),
          ),
        ),
        act: (bloc) => bloc.add(
          const SetFavoriteEvent(
            isFavorite: true,
          ),
        ),
        expect: () => [
          isA<LoadingSetFavoriteState>(),
          isA<LoadedSetFavoriteState>(),
        ],
      );

      blocTest<RestaurantDetailBloc, RestaurantDetailState>(
        'should emit LoadedSetFavoriteState when SetFavoriteEvent is called and isFavorite is false',
        build: () => RestaurantDetailBloc(
          restaurantDetailRepository: mockRestaurantDetailRepository,
        ),
        seed: () => const RestaurantDetailInitialState(
          Model(
            restaurant: Restaurant(),
          ),
        ),
        act: (bloc) => bloc.add(
          const SetFavoriteEvent(
            isFavorite: false,
          ),
        ),
        expect: () => [
          isA<LoadingSetFavoriteState>(),
          isA<LoadedSetFavoriteState>(),
        ],
      );

      blocTest<RestaurantDetailBloc, RestaurantDetailState>(
        'should emit ErrorSetFavoriteState when SetFavoriteEvent is called',
        build: () => RestaurantDetailBloc(
          restaurantDetailRepository: mockRestaurantDetailRepositoryWithError,
        ),
        seed: () => const RestaurantDetailInitialState(
          Model(
            restaurant: Restaurant(),
          ),
        ),
        act: (bloc) => bloc.add(
          const SetFavoriteEvent(
            isFavorite: false,
          ),
        ),
        expect: () => [
          isA<LoadingSetFavoriteState>(),
          isA<ErrorSetFavoriteState>(),
        ],
      );
    },
  );
}
