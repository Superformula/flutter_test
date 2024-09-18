import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:restaurant_tour/restaurant_list/bloc/restaurant_list_bloc.dart';

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  group('RestaurantListBloc', () {
    late MockRestaurantRepository restaurantRepository;

    setUp(() {
      restaurantRepository = MockRestaurantRepository();
    });

    blocTest<RestaurantListBloc, RestaurantListState>(
      'emits [RestaurantListLoading, RestaurantListData] when FetchRestaurantList is added',
      build: () {
        when(() => restaurantRepository.fetchRestaurants()).thenAnswer(
          (_) async => const RestaurantQueryResult(
            restaurants: [
              Restaurant(id: '1', name: 'Restaurant 1'),
              Restaurant(id: '2', name: 'Restaurant 2'),
            ],
          ),
        );
        return RestaurantListBloc(restaurantRepository);
      },
      act: (bloc) => bloc.add(const FetchRestaurantList()),
      expect: () => [
        const RestaurantListLoading(),
        const RestaurantListData(
          restaurants: [
            Restaurant(id: '1', name: 'Restaurant 1'),
            Restaurant(id: '2', name: 'Restaurant 2'),
          ],
        ),
      ],
    );

    blocTest<RestaurantListBloc, RestaurantListState>(
      'emits [RestaurantListLoading, RestaurantListError] when fetchRestaurants throws an error',
      build: () {
        when(() => restaurantRepository.fetchRestaurants())
            .thenThrow(Exception('Error fetching restaurants'));
        return RestaurantListBloc(restaurantRepository);
      },
      act: (bloc) => bloc.add(const FetchRestaurantList()),
      expect: () => [
        const RestaurantListLoading(),
        const RestaurantListError(
          message: 'Exception: Error fetching restaurants',
        ),
      ],
    );

    blocTest<RestaurantListBloc, RestaurantListState>(
      'emits [RestaurantDetail] when GoToRestaurantDetail is added',
      build: () {
        return RestaurantListBloc(restaurantRepository);
      },
      act: (bloc) => bloc.add(
        const GoToRestaurantDetail(
          restaurant: Restaurant(id: '1', name: 'Restaurant 1'),
        ),
      ),
      expect: () => [
        const RestaurantDetail(
          restaurant: Restaurant(id: '1', name: 'Restaurant 1'),
        ),
      ],
    );
  });
}
