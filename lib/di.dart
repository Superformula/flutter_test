import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_state.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  const _apiKey =
      'GHkayrA5gTd3I5r3ovx1GlFloEmZH-kv2seU7X9FGZFFOq-ASxGe4v1R6rIFShyuui9gvSROQH2Eaqrdu6lLXykzh6OfTSmCE3h773bSnqdV2MJV_w_WlqbkOtvVZnYx';
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

  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      HomeLoading(),
    ),
  );
}
