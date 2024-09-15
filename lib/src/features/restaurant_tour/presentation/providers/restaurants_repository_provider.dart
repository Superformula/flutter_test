import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/infrastructure/datasources/restaurant_api_datasource.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/infrastructure/repositories/restaurant_repository_impl.dart';

final restaurantsRepositoryProvider = Provider((ref) {
  return RestaurantRepositoryImpl(RestaurantApiDatasource());
});
