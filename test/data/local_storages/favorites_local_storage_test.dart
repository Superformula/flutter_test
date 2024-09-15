import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/storage.dart';
import 'package:restaurant_tour/data/local_storages/favorites_local_storage.dart';
import 'package:restaurant_tour/domain/local_storages/favorites_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

import '../../utils/mocks.dart';

void main() {
  late FavoritesLocalStorageContract favoritesLocalStorage;
  late StorageInterface storage;

  setUp(() {
    storage = MockStorage();
    favoritesLocalStorage = FavoritesLocalStorage(storage: storage);
  });

  group(
    FavoritesLocalStorage,
    () {
      test('Should get a list of restaurants', () async {
        //Arrange

        when(() => storage.read(any())).thenAnswer((_) async => '[]');
        //Act
        final result = await favoritesLocalStorage.getFavorites();
        //Assert
        expect(result, []);
        verify(() => storage.read('favorites')).called(1);
      });
      test('Should save a restaurants', () async {
        //Arrange
        const Restaurant restaurant = Restaurant();
        when(() => storage.write(any(), any())).thenAnswer((_) async {});
        when(() => storage.read(any())).thenAnswer((_) async => '[]');

        //Act
        await favoritesLocalStorage.saveFavorite(restaurant);
        //Assert

        verify(() => storage.write('favorites', any())).called(1);
      });
      test('Should remove a restaurants', () async {
        //Arrange
        const Restaurant restaurant = Restaurant();
        when(() => storage.write(any(), any())).thenAnswer((_) async {});
        when(() => storage.read(any())).thenAnswer((_) async => '[]');

        //Act
        await favoritesLocalStorage.removeFavorite(restaurant);
        //Assert

        verify(() => storage.write('favorites', any())).called(1);
      });
    },
  );
}
