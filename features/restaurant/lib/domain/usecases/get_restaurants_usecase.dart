import 'package:dependency_injection/dependency_injection.dart';
import 'package:either_dart/either.dart';
import '../repository/get_restaurant/get_restaurants_repository.dart';
import '../repository/get_restaurant/errors/get_restaurant_errors.dart';
import '../models/restaurant.dart';

class GetRestaurantsUsecase {
  final GetRestaurantsRepository _repository =
      SFInjector.instance.get<GetRestaurantsRepository>();

  Future<Either<GetRestaurantError, RestaurantQueryResult>> execute() async {
    return await _repository.getRestaurants();
  }
}
