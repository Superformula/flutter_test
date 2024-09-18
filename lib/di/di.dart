import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/data/datasource/graphql/graphql_restaurants_datasource.dart';
import 'package:restaurant_tour/data/datasource/local/sp_favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/data/datasource/memory/memory_restaurants_datasource.dart';
import 'package:restaurant_tour/domain/datasource/favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/domain/repository/restaurants_repository.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup({testMode = false}) {
  getIt.allowReassignment = testMode;
  getIt.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  getIt.registerSingletonAsync<FavoriteRestaurantsDatasource>(
      () async => SpFavoriteRestaurantsDatasource(GetIt.I.get()),
      dependsOn: [InitDependency(SharedPreferences)]);
  getIt.registerSingleton<RestaurantsDatasource>(
    MemoryRestaurantsDatasource(),
  );

  getIt.registerSingletonAsync<RestaurantsRepository>(
    () async => RestaurantsRepository(
      GetIt.I.get(),
      GetIt.I.get(),
    ),
    dependsOn: [
      InitDependency(FavoriteRestaurantsDatasource),
    ],
  );

  getIt.registerSingletonAsync<RestaurantsUsecase>(
    () async => RestaurantsUsecase(
      GetIt.I.get(),
    ),
    dependsOn: [
      InitDependency(RestaurantsRepository),
    ],
  );
  getIt.registerSingletonAsync<RestaurantsBloc>(
    () async => RestaurantsBloc(
      GetIt.I.get(),
    ),
    dependsOn: [
      InitDependency(RestaurantsUsecase),
    ],
  );
  getIt.registerSingletonAsync<FavoritesRestaurantsBloc>(
    () async => FavoritesRestaurantsBloc(
      GetIt.I.get(),
    ),
    dependsOn: [
      InitDependency(RestaurantsUsecase),
    ],
  );
}
