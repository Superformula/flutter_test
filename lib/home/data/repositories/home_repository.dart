import 'package:dartz/dartz.dart';
import 'package:restaurant_tour/home/failures/failures.dart';

import '../../../models/restaurant.dart';
import '../../domain/repositories/home_repository_interface.dart';
import '../datasources/home_data_source.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeDataSourceInterface dataSource;

  const HomeRepository(this.dataSource);

  @override
  Future<Either<RestaurantsFailure, RestaurantQueryResult>>
      getAllRestaurants() => dataSource.getAllRestaurants();
}
