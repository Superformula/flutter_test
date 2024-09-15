import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/local_storages/favorites_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/usecase_contracts/favorites_usecase_contract.dart';
import 'package:restaurant_tour/domain/usecases/favorites_usecase.dart';

import '../../utils/mocks.dart';

void main() {
  late FavoritesUsecaseContract favoritesUsecaseContract;
  late FavoritesLocalStorageContract favoritesLocalStorageContract;

  setUp(() {
    registerFallbackValue(FakeRestaurant());
    favoritesLocalStorageContract = MockFavoritesLocalStorage();
    favoritesUsecaseContract = FavoritesUsecase(
      favoritesLocalStorge: favoritesLocalStorageContract,
    );
  });

  group(
    'FavoritesUsecase',
    () {
      test('Should get a list of restaurants', () async {
        //Arrange
        when(() => favoritesLocalStorageContract.getFavorites())
            .thenAnswer((_) async => []);
        //Act
        await favoritesUsecaseContract.getFavorites();
        //Assert
        verify(() => favoritesLocalStorageContract.getFavorites()).called(1);
      });
      test('Should save a restaurants', () async {
        //Arrange
        when(() => favoritesLocalStorageContract.getFavorites())
            .thenAnswer((_) async => []);
        when(() => favoritesLocalStorageContract.saveFavorite(any()))
            .thenAnswer((_) async {});
        const restaurant = Restaurant();
        //Act
        await favoritesUsecaseContract.saveFavorite(restaurant);
        //Assert
        verify(() => favoritesLocalStorageContract.saveFavorite(restaurant))
            .called(1);
      });
      test('Should check if a restaurant is favorite', () async {
        //Arrange
        when(() => favoritesLocalStorageContract.getFavorites())
            .thenAnswer((_) async => []);
        const restaurant = Restaurant();
        //Act
        await favoritesUsecaseContract.isFavorite(restaurant);
        //Assert
        verify(() => favoritesLocalStorageContract.getFavorites()).called(1);
      });
      test('Should remove a restaurants', () async {
        //Arrange
        when(() => favoritesLocalStorageContract.removeFavorite(any()))
            .thenAnswer((_) async {});
        const restaurant = Restaurant();

        //Act
        await favoritesUsecaseContract.removeFavorite(restaurant);
        //Assert
        verify(() => favoritesLocalStorageContract.removeFavorite(restaurant))
            .called(1);
      });
    },
  );
}
