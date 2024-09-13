import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:restaurant_tour/app/app.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late FavoriteCubit favoriteCubit;
  late Storage hydratedStorage;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    hydratedStorage = MockStorage();
    when(() => hydratedStorage.write(any(), any<dynamic>()))
        .thenAnswer((_) async {});

    when(() => hydratedStorage.read(any())).thenReturn({
      'restaurants': [],
    });

    HydratedBloc.storage = hydratedStorage;
    favoriteCubit = FavoriteCubit();
  });

  tearDown(() {
    favoriteCubit.close();
  });

  blocTest<FavoriteCubit, FavoriteState>(
    'Emits [FavoriteLoaded] when restoring favorites from storage',
    build: () => favoriteCubit,
    act: (bloc) => bloc.emit(favoriteCubit.fromJson({'restaurants': []})),
    expect: () => [isA<FavoriteLoaded>()],
  );

  blocTest<FavoriteCubit, FavoriteState>(
    'Emits [FavoriteError] when an exception occurs while restoring favorites from storage.',
    setUp: () => when(() => hydratedStorage.read(any())).thenReturn({
      'error': {'error'},
    }),
    build: () => favoriteCubit,
    act: (bloc) =>
        bloc.emit(favoriteCubit.fromJson(hydratedStorage.read('key'))),
    expect: () => [isA<FavoriteError>()],
  );

  blocTest<FavoriteCubit, FavoriteState>(
    'Emits true when the restaurant is in favorites',
    build: () => favoriteCubit,
    seed: () => FavoriteLoaded(
      restaurants: [const Restaurant(id: '1', name: 'Test Restaurant')],
    ),
    act: (bloc) {
      final isFav =
          bloc.isFavorite(const Restaurant(id: '1', name: 'Test Restaurant'));
      expect(isFav, isTrue);
    },
  );

  blocTest<FavoriteCubit, FavoriteState>(
    'Emits false when the restaurant is not in favorites',
    build: () => favoriteCubit,
    seed: () => FavoriteLoaded(
      restaurants: [const Restaurant(id: '2', name: 'Another Restaurant')],
    ),
    act: (bloc) {
      final isFav =
          bloc.isFavorite(const Restaurant(id: '1', name: 'Test Restaurant'));
      expect(isFav, isFalse);
    },
  );

  blocTest<FavoriteCubit, FavoriteState>(
    'Adds a restaurant to favorites when it is not already in the list',
    build: () => favoriteCubit,
    seed: () => FavoriteLoaded(restaurants: []),
    act: (bloc) => bloc.toggleFavorite(
      const Restaurant(id: '1', name: 'Test Restaurant'),
    ),
    expect: () => [
      isA<FavoriteLoaded>().having(
        (state) => state.restaurants.length,
        'favorites count',
        1,
      ),
    ],
  );

  blocTest<FavoriteCubit, FavoriteState>(
    'Removes a restaurant from favorites when it is already in the list',
    build: () => favoriteCubit,
    seed: () => FavoriteLoaded(
      restaurants: [const Restaurant(id: '1', name: 'Test Restaurant')],
    ),
    act: (bloc) => bloc.toggleFavorite(
      const Restaurant(id: '1', name: 'Test Restaurant'),
    ),
    expect: () => [
      isA<FavoriteLoaded>().having(
        (state) => state.restaurants.length,
        'favorites count',
        0,
      ),
    ],
  );

  blocTest<FavoriteCubit, FavoriteState>(
    'Emits FavoriteError when the state is not FavoriteLoaded',
    build: () => favoriteCubit,
    seed: () => FavoriteError(),
    act: (bloc) => bloc.toggleFavorite(
      const Restaurant(id: '1', name: 'Test Restaurant'),
    ),
    expect: () => [isA<FavoriteError>()],
  );
}
