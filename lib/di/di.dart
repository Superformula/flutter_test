import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/data/datasources/local/provider/base_database_provider.dart';
import 'package:restaurant_tour/data/datasources/local/provider/database_provider.dart';
import 'package:restaurant_tour/data/datasources/local/restaurant_local_data_source.dart';
import 'package:restaurant_tour/data/datasources/remote/restaurant_remote_data_source.dart';
import 'package:restaurant_tour/data/repositories/datasource/restaurant_local_data_source.dart';
import 'package:restaurant_tour/data/repositories/datasource/restaurant_remote_data_source.dart';
import 'package:restaurant_tour/data/repositories/mock/mocked_restaurants_repository.dart';
import 'package:restaurant_tour/data/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  const apiKey = String.fromEnvironment('API_KEY');
  const mockApi = bool.fromEnvironment('MOCK_API', defaultValue: false);
  final shouldMockApi = apiKey.isEmpty || mockApi;

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.yelp.com',
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/graphql',
        },
      ),
    ),
  );

  getIt.registerSingletonAsync<BaseDatabaseProvider>(
    () async {
      final provider = DatabaseProvider();
      await provider.init();
      return provider;
    },
    dispose: (instance) => instance.close(),
  );

  getIt.registerSingleton<BaseRestaurantRemoteDataSource>(
    RestaurantRemoteDataSource(httpClient: getIt.get()),
  );

  getIt.registerSingletonWithDependencies<BaseRestaurantLocalDataSource>(
    () => RestaurantLocalDataSource(databaseProvider: getIt.get()),
    dependsOn: [BaseDatabaseProvider],
  );

  await getIt.allReady();

  getIt.registerLazySingleton<BaseRestaurantsRepository>(
    () => shouldMockApi
        ? MockedRestaurantsRepository()
        : RestaurantsRepository(
            remoteDataSource: getIt.get(),
            localDataSource: getIt.get(),
          ),
    dispose: (repo) => repo.dispose(),
  );

  getIt.registerFactory<GetRestaurantsUseCase>(
    () => GetRestaurantsUseCase(restaurantsRepository: getIt.get()),
  );

  getIt.registerFactory<GetFavoriteRestaurantsUseCase>(
    () => GetFavoriteRestaurantsUseCase(restaurantsRepository: getIt.get()),
  );

  getIt.registerFactory<ToggleFavoriteUseCase>(
    () => ToggleFavoriteUseCase(restaurantsRepository: getIt.get()),
  );
}
