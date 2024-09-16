import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';

class FakeRestaurant extends Fake implements Restaurant {}

Restaurant _restaurant = Restaurant(
  categories: [Category(title: 'Italiano'), Category(title: 'Mexicano')],
  photos: const [
    "https://s3-media2.fl.yelpcdn.com/bphoto/FxmtjuzPDiL7vx5KyceWuQ/o.jpg",
  ],
  hours: const [Hours(isOpenNow: true)],
  location: Location(formattedAddress: 'casa doparaguai'),
  id: '1',
  name: 'boteco da bruxa',
  price: 'bem caro',
  rating: 4.4,
  reviews: const [
    Review(id: '1234', rating: 4, user: User(name: 'Guilherme')),
  ],
);

void main() {
  late FavoriteCubit favoriteCubit;

  setUp(() {
    favoriteCubit = FavoriteCubit();
    registerFallbackValue(FakeRestaurant);
  });

  tearDown(() {
    favoriteCubit.close();
  });

  group('Favorite Restaurant function test', () {
    blocTest<FavoriteCubit, FavoriteState>(
      'Should emit favoriteSuccess and Success status when an restaurant is added to empty list',
      build: () => favoriteCubit,
      act: (cubit) => cubit.favoriteRestaurant(_restaurant),
      expect: () => <FavoriteState>[
        FavoriteState(status: FavoriteStatus.favoriteSuccess),
        FavoriteState(status: FavoriteStatus.success, favorites: [_restaurant]),
      ],
    );
    blocTest<FavoriteCubit, FavoriteState>(
      'When removing last restaurant should emit an empty list and removed and initial states',
      build: () => favoriteCubit,
      seed: () => FavoriteState(favorites: [_restaurant]),
      act: (cubit) => favoriteCubit.favoriteRestaurant(_restaurant),
      expect: () => <dynamic>[
        isA<FavoriteState>()
            .having((f) => f.status, 'status', FavoriteStatus.removed)
            .having((f) => f.favorites, 'favorites', []),
        FavoriteState(status: FavoriteStatus.initial),
      ],
    );

    blocTest<FavoriteCubit, FavoriteState>(
      'Should remove an already added restaurant ',
      build: () => favoriteCubit,
      seed: () => FavoriteState(
        favorites: [
          const Restaurant(id: '1', name: 'Breaking bad'),
          const Restaurant(id: '2', name: 'Better call saul'),
        ],
      ),
      act: (cubit) {
        const restaurant = Restaurant(id: '1', name: 'Breaking bad');

        cubit.favoriteRestaurant(restaurant);

        return cubit;
      },
      expect: () => <dynamic>[
        isA<FavoriteState>()
            .having((f) => f.status, 'status', FavoriteStatus.removed)
            .having(
          (f) => f.favorites,
          'favorites',
          const [Restaurant(id: '2', name: 'Better call saul')],
        ),
      ],
    );
  });
}
