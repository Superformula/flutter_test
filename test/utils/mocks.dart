import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/core/utils/storage.dart';
import 'package:restaurant_tour/domain/local_storages/favorites_local_storage_contract.dart';
import 'package:restaurant_tour/domain/local_storages/restaurants_local_storage_contract.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository_contract.dart';
import 'package:restaurant_tour/domain/usecase_contracts/favorites_usecase_contract.dart';
import 'package:restaurant_tour/domain/usecase_contracts/get_restaurants_usecase_contract.dart';

class MockStorage extends Mock implements Storage {}

class MockDio extends Mock implements Dio {}

class MockFavoritesLocalStorage extends Mock
    implements FavoritesLocalStorageContract {}

class FakeRestaurant extends Fake implements Restaurant {}

class MockYelpRepository extends Mock implements YelpRepositoryContract {}

class MockRestaurantsLocalStorageContract extends Mock
    implements RestaurantsLocalStorageContract {}

class MockFavoritesUsecaseContract extends Mock
    implements FavoritesUsecaseContract {}

class MockGetRestaurantsUsecaseContract extends Mock
    implements GetRestaurantsUsecaseContract {}
