import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository.dart';
import 'package:restaurant_tour/aplication/yelp/yelp_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import 'yelp_bloc_test.mocks.dart';

@GenerateMocks([YelpRepository])
void main() {
  late MockYelpRepository mockYelpRepository;
  late YelpBloc yelpBloc;

  setUp(() {
    mockYelpRepository = MockYelpRepository();
    yelpBloc = YelpBloc(mockYelpRepository);
  });

  group('YelpBloc Add/Remove FavoriteRestaurant', () {
    blocTest<YelpBloc, YelpState>(
      'emits updated favorites list when AddFavoriteRestaurant is added',
      build: () => yelpBloc,
      act: (bloc) => bloc.add(const AddFavoriteRestaurant(
          Restaurant(id: '1', name: 'Restaurant 1', rating: 4.5))),
      expect: () => [
        YelpState.initial().copyWith(
          favoriteRestaurants: [
            const Restaurant(id: '1', name: 'Restaurant 1', rating: 4.5)
          ],
        ),
      ],
    );

    blocTest<YelpBloc, YelpState>(
      'emits updated favorites list when RemoveFavoriteRestaurant is added',
      build: () => yelpBloc,
      seed: () => YelpState.initial().copyWith(
        favoriteRestaurants: [
          const Restaurant(id: '1', name: 'Restaurant 1', rating: 4.5)
        ],
      ),
      act: (bloc) => bloc.add(const RemoveFavoriteRestaurant('1')),
      expect: () => [
        YelpState.initial().copyWith(favoriteRestaurants: []),
      ],
    );
  });
}
