import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/storage.dart';
import 'package:restaurant_tour/data/local_storages/restaurants_local_storage.dart';
import 'package:restaurant_tour/domain/local_storages/restaurants_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

import '../../utils/mocks.dart';

void main() {
  late RestaurantsLocalStorageContract restaurantsLocalStorage;
  late StorageInterface storage;

  setUp(() {
    storage = MockStorage();
    restaurantsLocalStorage = RestaurantsLocalStorage(localStorage: storage);
  });

  group(
    RestaurantsLocalStorage,
    () {
      test('Should get a list of restaurants', () async {
        //Arrange

        when(() => storage.read(any())).thenAnswer((_) async => '[]');
        //Act
        final result = await restaurantsLocalStorage.getCachedRestaurants();
        //Assert
        expect(result, []);
        verify(() => storage.read('restaurants')).called(1);
      });
      test('Should save a restaurants', () async {
        //Arrange
        const restaurant = Restaurant();
        when(() => storage.write(any(), any())).thenAnswer((_) async {});
        when(() => storage.read(any())).thenAnswer((_) async => '[]');

        //Act
        await restaurantsLocalStorage.saveRestaurants([restaurant]);
        //Assert

        verify(() => storage.write('restaurants', any())).called(1);
      });
    },
  );
}
