import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:restaurant_tour/restaurant_detail/bloc/restaurant_detail_bloc.dart';

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

class MockRestaurant extends Mock implements Restaurant {}

void main() {
  late RestaurantDetailBloc bloc;
  late MockRestaurantRepository mockRepository;
  late Restaurant restaurant;

  setUp(() {
    mockRepository = MockRestaurantRepository();
    restaurant = MockRestaurant();
    bloc = RestaurantDetailBloc(mockRepository);

    when(() => restaurant.id).thenReturn('restaurant-1');
  });

  group('RestaurantDetailBloc', () {
    blocTest<RestaurantDetailBloc, RestaurantDetailState>(
      'emits [RestaurantDetailLoading, RestaurantDetailLoaded] when '
      'FetchRestaurantIsFavorite is added and the restaurant is a favorite',
      build: () {
        when(() => mockRepository.isFavorite('restaurant-1'))
            .thenAnswer((_) async => true);
        return bloc;
      },
      act: (bloc) =>
          bloc.add(FetchRestaurantIsFavorite(restaurant: restaurant)),
      expect: () => [
        const RestaurantDetailLoading(),
        const RestaurantDetailLoaded(isFavorite: true),
      ],
      verify: (_) {
        verify(() => mockRepository.isFavorite('restaurant-1')).called(1);
      },
    );

    blocTest<RestaurantDetailBloc, RestaurantDetailState>(
      'emits [RestaurantDetailLoading, RestaurantDetailLoaded] when '
      'FetchRestaurantIsFavorite is added and the restaurant is not a favorite',
      build: () {
        when(() => mockRepository.isFavorite('restaurant-1'))
            .thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) =>
          bloc.add(FetchRestaurantIsFavorite(restaurant: restaurant)),
      expect: () => [
        const RestaurantDetailLoading(),
        const RestaurantDetailLoaded(isFavorite: false),
      ],
      verify: (_) {
        verify(() => mockRepository.isFavorite('restaurant-1')).called(1);
      },
    );

    blocTest<RestaurantDetailBloc, RestaurantDetailState>(
      'emits [RestaurantDetailLoaded] when ToggleRestaurantFavorite is '
      'added and the restaurant is a favorite (removes it)',
      build: () {
        when(() => mockRepository.isFavorite('restaurant-1'))
            .thenAnswer((_) async => true);
        when(() => mockRepository.deleteFavoriteRestaurant(restaurant))
            .thenAnswer((_) async {});
        return bloc;
      },
      act: (bloc) => bloc.add(ToggleRestaurantFavorite(restaurant: restaurant)),
      expect: () => [
        const RestaurantDetailLoaded(isFavorite: false),
      ],
      verify: (_) {
        verify(() => mockRepository.isFavorite('restaurant-1')).called(1);
        verify(() => mockRepository.deleteFavoriteRestaurant(restaurant))
            .called(1);
      },
    );

    blocTest<RestaurantDetailBloc, RestaurantDetailState>(
      'emits [RestaurantDetailLoaded] when ToggleRestaurantFavorite is '
      'added and the restaurant is not a favorite (adds it)',
      build: () {
        when(() => mockRepository.isFavorite('restaurant-1'))
            .thenAnswer((_) async => false);
        when(() => mockRepository.saveFavoriteRestaurant(restaurant))
            .thenAnswer((_) async {});
        return bloc;
      },
      act: (bloc) => bloc.add(ToggleRestaurantFavorite(restaurant: restaurant)),
      expect: () => [
        const RestaurantDetailLoaded(isFavorite: true),
      ],
      verify: (_) {
        verify(() => mockRepository.isFavorite('restaurant-1')).called(1);
        verify(() => mockRepository.saveFavoriteRestaurant(restaurant))
            .called(1);
      },
    );
  });
}
