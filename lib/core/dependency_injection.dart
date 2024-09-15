import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/core/environment.dart';
import 'package:restaurant_tour/core/utils/storage.dart';
import 'package:restaurant_tour/data/local_storages/favorites_local_storage.dart';
import 'package:restaurant_tour/data/local_storages/restaurants_local_storage.dart';
import 'package:restaurant_tour/data/repositories/yelp_repository.dart';
import 'package:restaurant_tour/domain/local_storages/favorites_local_storage_contract.dart';
import 'package:restaurant_tour/domain/local_storages/restaurants_local_storage_contract.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository_contract.dart';
import 'package:restaurant_tour/domain/usecase_contracts/favorites_usecase_contract.dart';
import 'package:restaurant_tour/domain/usecase_contracts/get_restaurants_usecase_contract.dart';
import 'package:restaurant_tour/domain/usecases/favorites_usecase.dart';
import 'package:restaurant_tour/domain/usecases/get_restaurants_usecase.dart';
import 'package:restaurant_tour/presentation/controllers/favorites/favorites_cubit.dart';
import 'package:restaurant_tour/presentation/controllers/restaurants/restaurants_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._internal();

  factory DependencyInjection() {
    return _singleton;
  }

  DependencyInjection._internal();

  Future<void> init() async {
    //Core
    getIt.registerLazySingleton<StorageInterface>(
      () => Storage(
        getIt.get<SharedPreferences>(),
      ),
    );

    //Data
    getIt.registerLazySingleton<RestaurantsLocalStorageContract>(
      () => RestaurantsLocalStorage(
        localStorage: getIt.get<StorageInterface>(),
      ),
    );

    getIt.registerLazySingleton<YelpRepositoryContract>(
      () => YelpRepository(
        dio: getIt.get<Dio>(),
      ),
    );

    getIt.registerLazySingleton<FavoritesLocalStorageContract>(
      () => FavoritesLocalStorage(
        storage: getIt.get<StorageInterface>(),
      ),
    );

    //Usecases
    getIt.registerLazySingleton<GetRestaurantsUsecaseContract>(
      () => GetRestaurantsUsecase(
        yelpRepositoryContract: getIt.get<YelpRepositoryContract>(),
        restaurantsLocalStorageContract:
            getIt.get<RestaurantsLocalStorageContract>(),
      ),
    );

    getIt.registerLazySingleton<FavoritesUsecaseContract>(
      () => FavoritesUsecase(
        favoritesLocalStorge: getIt.get<FavoritesLocalStorageContract>(),
      ),
    );

    //Cubit
    getIt.registerLazySingleton<RestaurantsCubit>(
      () => RestaurantsCubit(
        getRestaurantsUsecaseContract:
            getIt.get<GetRestaurantsUsecaseContract>(),
      ),
    );

    getIt.registerFactory<FavoritesCubit>(
      () => FavoritesCubit(
        favoritesUsecaseContract: getIt.get<FavoritesUsecaseContract>(),
      ),
    );

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    getIt.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://api.yelp.com',
          headers: {
            'Authorization': 'Bearer ${Environment.apiKey}',
            'Content-Type': 'application/graphql',
          },
        ),
      ),
    );
  }
}
