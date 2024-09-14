import 'package:restaurant_tour/domain/local_storages/restaurants_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository_contract.dart';
import 'package:restaurant_tour/domain/usecase_contracts/get_restaurants_usecase_contract.dart';

class GetRestaurantsUsecase implements GetRestaurantsUsecaseContract {
  GetRestaurantsUsecase({
    required YelpRepositoryContract yelpRepositoryContract,
    required RestaurantsLocalStorageContract restaurantsLocalStorageContract,
  })  : _yelpRepositoryContract = yelpRepositoryContract,
        _restaurantsLocalStorageContract = restaurantsLocalStorageContract;

  final YelpRepositoryContract _yelpRepositoryContract;
  final RestaurantsLocalStorageContract _restaurantsLocalStorageContract;

  @override
  Future<List<Restaurant>> getRestaurants({
    bool forceFetch = false,
    int offset = 0,
  }) async {
    final cachedRestaurants =
        await _restaurantsLocalStorageContract.getCachedRestaurants();

    if (cachedRestaurants.isNotEmpty && !forceFetch) {
      return cachedRestaurants;
    }

    final restaurantsQueryResults =
        await _yelpRepositoryContract.getRestaurants(offset: offset);
    final restaurants = restaurantsQueryResults?.restaurants;
    await _restaurantsLocalStorageContract.saveRestaurants(restaurants ?? []);
    return restaurants ?? [];
  }
}
