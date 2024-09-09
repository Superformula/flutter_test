import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/features/restaurant/data/data_sources/remote_datasource.dart';
import 'package:restaurant_tour/features/restaurant/data/repositories/yelp_repository_impl.dart';
import 'package:restaurant_tour/features/restaurant/domain/repositories/yelp_repository.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_favorites.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/get_restaurants.dart';
import 'package:restaurant_tour/features/restaurant/domain/use_cases/mark_favorite.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  const _apiKey =
      'jvWqxC5xhVHIwruAaM4dgsO9Gk6j_nfPeeErabJvh6LllVAVNj1fr4GcWzHXq5JIRlCgiPudUO45KW7g8Wsxmx_sJcwx3YMbD8yAcvbm_0bF_zyMzNbb8UgdE07aZnYx';
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
  getIt.registerLazySingleton<RemoteDatasource>(
    () => RemoteDatasourceImpl(dio: getIt()),
  );

  getIt.registerLazySingleton<YelpRepository>(
    () => YelpRepositoryImpl(datasource: getIt()),
  );

  getIt.registerFactory(() => GetRestaurants(getIt()));

  getIt.registerFactory(() => GetFavorites(getIt()));

  getIt.registerFactory(() => MarkFavorite(getIt()));

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getIt(),
      getIt(),
      getIt(),
    ),
  );
}
