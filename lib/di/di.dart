import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';

import 'package:restaurant_tour/data/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';

import 'package:restaurant_tour/data/repositories/mock/mocked_restaurants_repository.dart';

final getIt = GetIt.instance;

void setupDI() {
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

  getIt.registerLazySingleton<BaseRestaurantsRepository>(
    () => shouldMockApi
        ? MockedRestaurantsRepository()
        : RestaurantsRepository(httpClient: getIt.get()),
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
