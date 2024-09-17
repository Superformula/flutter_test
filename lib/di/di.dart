import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/data/datasource/memory_favorite_restaurants_datasource.dart';
import 'package:restaurant_tour/data/datasource/memory_restaurants_datasource.dart';

import 'package:restaurant_tour/domain/repository/restaurants_repository.dart';
import 'package:restaurant_tour/domain/usecase/restaurants_usecase.dart';
import 'package:restaurant_tour/presentation/favorites/favorites_restaurants_bloc.dart';
import 'package:restaurant_tour/presentation/restaurants/restaurants_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  final restaurantDataSource = MemoryRestaurantsDatasource();
  final favoriteRestaurantsDatasource = MemoryFavoriteRestaurantsDatasource();
  final repository = RestaurantsRepository(
      restaurantDataSource, favoriteRestaurantsDatasource);
  final usecase = RestaurantsUsecase(repository);

  getIt.registerSingleton<RestaurantsBloc>(
    RestaurantsBloc(usecase),
  );
  getIt.registerSingleton<FavoritesRestaurantsBloc>(
    FavoritesRestaurantsBloc(usecase),
  );
}
