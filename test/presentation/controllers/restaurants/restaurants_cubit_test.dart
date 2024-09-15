import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/usecase_contracts/get_restaurants_usecase_contract.dart';
import 'package:restaurant_tour/presentation/controllers/restaurants/restaurants_cubit.dart';

import '../../../utils/mocks.dart';

void main() {
  late RestaurantsCubit restaurantsCubit;
  late GetRestaurantsUsecaseContract getRestaurantsUsecaseContract;

  setUp(() {
    getRestaurantsUsecaseContract = MockGetRestaurantsUsecaseContract();
    restaurantsCubit = RestaurantsCubit(
        getRestaurantsUsecaseContract: getRestaurantsUsecaseContract);
  });

  group(RestaurantsCubit, () {
    test('Should get restaurants with success', () async {
      //Arrange
      when(() => getRestaurantsUsecaseContract.getRestaurants(
          forceFetch: any(named: 'forceFetch'),
          offset: any(named: 'offset'))).thenAnswer((_) async => []);
      //Act
      restaurantsCubit.getRestaurants();
      //Assert
      verify(() => getRestaurantsUsecaseContract.getRestaurants(
          forceFetch: false, offset: 0)).called(1);
    });

    test('Should get next page with success', () async {
      //Arrange
      when(() => getRestaurantsUsecaseContract.getRestaurants(
          forceFetch: any(named: 'forceFetch'),
          offset: any(named: 'offset'))).thenAnswer((_) async => []);
      //Act
      restaurantsCubit.getNextPage();
      //Assert
      verify(() => getRestaurantsUsecaseContract.getRestaurants(
          forceFetch: true, offset: 20)).called(1);
    });
  });
}
