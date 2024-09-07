import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/domain/use_cases/get_restaurants_use_case.dart';
import 'package:restaurant_tour/domain/use_cases/toggle_favorite.dart';

import 'package:restaurant_tour/data/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/use_cases/get_favorites_restaurants_use_case.dart';

final getIt = GetIt.instance;

// TODO: Expose it in a more secure way
const _apiKey =
    'FQVwPGF1gSkxwYDrdntEfehFGJRXb5HYBcLfesykIgAEeopf6_YrfvRmY_iGkQOnQ97oRwAqOcrGwHK0In71SGPnOJRKEBYUOo8IhiIS53HUVMdE2BiY1JeKIDLbZnYx';

void setupDI() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.yelp.com',
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/graphql',
        },
      ),
    ),
  );

  getIt.registerLazySingleton<BaseRestaurantsRepository>(
    () => RestaurantsRepository(httpClient: getIt.get()),
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
