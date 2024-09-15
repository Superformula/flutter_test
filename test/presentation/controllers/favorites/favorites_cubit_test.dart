import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/usecase_contracts/favorites_usecase_contract.dart';
import 'package:restaurant_tour/presentation/controllers/favorites/favorites_cubit.dart';

import '../../../utils/mocks.dart';

void main() {
  late FavoritesCubit favoritesCubit;
  late FavoritesUsecaseContract favoritesUsecaseContract;

  setUp(() {
    registerFallbackValue(FakeRestaurant());

    favoritesUsecaseContract = MockFavoritesUsecaseContract();
    favoritesCubit =
        FavoritesCubit(favoritesUsecaseContract: favoritesUsecaseContract);
  });

  group(FavoritesCubit, () {
    test('Should get favorites with success', () async {
      //Arrange
      when(() => favoritesUsecaseContract.getFavorites())
          .thenAnswer((_) async => []);
      //Act
      favoritesCubit.getFavorites();
      //Assert
      verify(() => favoritesUsecaseContract.getFavorites()).called(1);
    });

    test('Should save favorite with success', () async {
      //Arrange
      when(() => favoritesUsecaseContract.saveFavorite(any()))
          .thenAnswer((_) async {});
      when(() => favoritesUsecaseContract.getFavorites())
          .thenAnswer((_) async => []);
      when(() => favoritesUsecaseContract.isFavorite(any()))
          .thenAnswer((_) async => true);

      //Act
      favoritesCubit.saveFavorite(FakeRestaurant());
      //Assert
      verify(() => favoritesUsecaseContract.saveFavorite(any())).called(1);
    });

    test('Should remove favorite with success', () async {
      //Arrange
      when(() => favoritesUsecaseContract.removeFavorite(any()))
          .thenAnswer((_) async {});
      //Act
      favoritesCubit.removeFavorite(FakeRestaurant());
      //Assert
      await untilCalled(() => favoritesUsecaseContract.removeFavorite(any()));
      verify(() => favoritesUsecaseContract.removeFavorite(any())).called(1);
    });

    test('Should check if restaurant is favorite with success', () async {
      //Arrange
      when(() => favoritesUsecaseContract.isFavorite(any()))
          .thenAnswer((_) async => true);
      //Act
      favoritesCubit.isFavorite(FakeRestaurant());
      //Assert
      await untilCalled(() => favoritesUsecaseContract.isFavorite(any()));
      verify(() => favoritesUsecaseContract.isFavorite(any())).called(1);
    });
  });
}
