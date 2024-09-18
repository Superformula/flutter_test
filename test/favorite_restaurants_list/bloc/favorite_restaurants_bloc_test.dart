import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_tour/favorite_restaurants_list/bloc/favorite_restaurants_bloc.dart';

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  late FavoriteRestaurantsBloc favoriteRestaurantsBloc;
  late MockRestaurantRepository mockRestaurantRepository;

  setUp(() {
    mockRestaurantRepository = MockRestaurantRepository();
    favoriteRestaurantsBloc = FavoriteRestaurantsBloc(mockRestaurantRepository);
  });

  group('FavoriteRestaurantsBloc', () {
    test('initial state is FavoriteRestaurantsLoading', () {
      expect(favoriteRestaurantsBloc.state, const FavoriteRestaurantsLoading());
    });

    blocTest<FavoriteRestaurantsBloc, FavoriteRestaurantsState>(
      'emits [FavoriteRestaurantsLoading, FavoriteRestaurantsData] when '
      'FetchFavoriteRestaurants is added and fetch is successful',
      build: () {
        when(() => mockRestaurantRepository.fetchFavoriteRestaurants())
            .thenAnswer((_) async => <Restaurant>[]);
        return favoriteRestaurantsBloc;
      },
      act: (bloc) => bloc.add(const FetchFavoriteRestaurants()),
      expect: () => [
        const FavoriteRestaurantsLoading(),
        const FavoriteRestaurantsData(restaurants: []),
      ],
      verify: (_) {
        verify(() => mockRestaurantRepository.fetchFavoriteRestaurants())
            .called(1);
      },
    );

    blocTest<FavoriteRestaurantsBloc, FavoriteRestaurantsState>(
      'emits [FavoriteRestaurantsLoading, FavoriteRestaurantsError] when FetchFavoriteRestaurants is added and fetch fails',
      build: () {
        when(() => mockRestaurantRepository.fetchFavoriteRestaurants())
            .thenThrow(Exception('error'));
        return favoriteRestaurantsBloc;
      },
      act: (bloc) => bloc.add(const FetchFavoriteRestaurants()),
      expect: () => [
        const FavoriteRestaurantsLoading(),
        const FavoriteRestaurantsError(message: 'Exception: error'),
      ],
      verify: (_) {
        verify(() => mockRestaurantRepository.fetchFavoriteRestaurants())
            .called(1);
      },
    );
  });
}
