import 'package:flutter/widgets.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';
import 'package:restaurant/domain/usecases/favorite/add_to_favorite_usecase.dart';
import 'package:restaurant/domain/usecases/favorite/check_restaurant_favorited_usecase.dart';
import 'package:restaurant/domain/usecases/favorite/get_favorite_restaurants_usecase.dart';
import 'package:restaurant/domain/usecases/favorite/remove_from_favorite_usecase.dart';
import 'package:restaurant/presentation/routes/restaurant_routes.dart';
import 'package:restaurant/repositories/favorites/cache_favorite_repository.dart';
import './domain/repository/get_restaurant/get_restaurants_repository.dart';
import './repositories/yelp_repository.dart';
import './domain/usecases/get_restaurants_usecase.dart';

class RestaurantModule extends SFModule {
  @override
  void registerProviders() {
    //Repositories
    SFInjector.instance.registerFactory<FavoriteRestaurantRepository>(
        () => CacheFavoriteRepository());
    SFInjector.instance
        .registerFactory<GetRestaurantsRepository>(() => YelpRepository());

    //Usecases
    SFInjector.instance
        .registerFactory<GetRestaurantsUsecase>(() => GetRestaurantsUsecase());
    SFInjector.instance
        .registerFactory<AddToFavoriteUseCase>(() => AddToFavoriteUseCase());
    SFInjector.instance.registerFactory<CheckRestaurantFavoritedUseCase>(
        () => CheckRestaurantFavoritedUseCase());
    SFInjector.instance.registerFactory<RemoveFromFavoriteUseCase>(
        () => RemoveFromFavoriteUseCase());
    SFInjector.instance.registerFactory<GetFavoriteRestaurantsUsecase>(
        () => GetFavoriteRestaurantsUsecase());
  }

  @override
  Map<String, Widget Function(dynamic p1)> get routes =>
      RestaurantRoutes.routes;
}
