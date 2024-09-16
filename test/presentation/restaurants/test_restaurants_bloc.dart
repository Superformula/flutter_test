import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';
import 'package:test/test.dart';

import 'test_restaurants_bloc.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RestaurantsUsecase>(),
])
late RestaurantsUsecase usecase;
late List<Restaurant> testRestaurants;
late Restaurant testRestaurant;
void main() {
  setUp(() {
    usecase = MockRestaurantsUsecase();
    testRestaurant = const Restaurant(id: 'test', name: 'Test Restaurant');
    testRestaurants = [
      const Restaurant(id: 'test_1', name: 'Test Restaurant'),
      const Restaurant(id: 'test_2', name: 'Test Restaurant'),
    ];
  });

  blocTest(
    'RestaurantsBloc should load restaurants and emit RestaurantsReadyState',
    setUp: () => when(usecase.getRestaurants())
        .thenAnswer((_) async => (testRestaurants)),
    build: () => RestaurantsBloc(usecase),
    act: (bloc) => bloc.add(LoadRestaurants()),
    wait: const Duration(milliseconds: 300),
    expect: () => [isA<RestaurantsLoading>(), isA<RestaurantsReady>()],
    verify: (bloc) => verify(usecase.getRestaurants()).called(1),
  );

  blocTest(
    'RestaurantsBloc should error RestaurantsListError',
    setUp: () =>
        when(usecase.getRestaurants()).thenThrow(RestaurantListException()),
    build: () => RestaurantsBloc(usecase),
    act: (bloc) => bloc.add(LoadRestaurants()),
    wait: const Duration(milliseconds: 300),
    expect: () => [isA<RestaurantsLoading>(), isA<RestaurantsError>()],
    verify: (bloc) => verify(usecase.getRestaurants()).called(1),
  );
}
