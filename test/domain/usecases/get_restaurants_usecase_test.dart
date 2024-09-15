import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/local_storages/restaurants_local_storage_contract.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository_contract.dart';
import 'package:restaurant_tour/domain/usecase_contracts/get_restaurants_usecase_contract.dart';
import 'package:restaurant_tour/domain/usecases/get_restaurants_usecase.dart';

import '../../utils/mocks.dart';

void main() {
  late GetRestaurantsUsecaseContract getRestaurantsUsecaseContract;
  late RestaurantsLocalStorageContract restaurantsLocalStorageContract;
  late YelpRepositoryContract yelpRepositoryContract;

  setUp(() {
    registerFallbackValue(FakeRestaurant());
    restaurantsLocalStorageContract = MockRestaurantsLocalStorageContract();
    yelpRepositoryContract = MockYelpRepository();
    getRestaurantsUsecaseContract = GetRestaurantsUsecase(
      yelpRepositoryContract: yelpRepositoryContract,
      restaurantsLocalStorageContract: restaurantsLocalStorageContract,
    );
  });

  group(GetRestaurantsUsecase, () {
    test('Should get a list of restaurants', () async {
      //Arrange
      when(() => restaurantsLocalStorageContract.getCachedRestaurants())
          .thenAnswer((_) async => []);
      when(
        () => restaurantsLocalStorageContract.saveRestaurants(
          any(),
        ),
      ).thenAnswer((_) async => []);
      when(() => yelpRepositoryContract.getRestaurants(offset: 0))
          .thenAnswer((_) async => null);

      //Act
      await getRestaurantsUsecaseContract.getRestaurants();
      //Assert
      verify(() => restaurantsLocalStorageContract.getCachedRestaurants())
          .called(1);
      // verify(() => yelpRepositoryContract.getRestaurants(offset: 0)).called(1);
    });
  });
}
