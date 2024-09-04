import 'package:flutter/widgets.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:restaurant/presentation/routes/restaurant_routes.dart';
import './domain/repository/get_restaurant/get_restaurants_repository.dart';
import './repositories/yelp_repository.dart';
import './domain/usecases/get_restaurants_usecase.dart';

class RestaurantModule extends SFModule {
  @override
  void registerProviders() {
    SFInjector.instance
        .registerFactory<GetRestaurantsRepository>(() => YelpRepository());
    SFInjector.instance
        .registerFactory<GetRestaurantsUsecase>(() => GetRestaurantsUsecase());
  }

  @override
  Map<String, Widget Function(dynamic p1)> get routes =>
      RestaurantRoutes.routes;
}
