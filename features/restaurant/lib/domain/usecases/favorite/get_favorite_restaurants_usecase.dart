import 'package:dependency_injection/dependency_injection.dart';
import 'package:either_dart/either.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';
import 'package:restaurant/domain/repository/get_restaurant/errors/get_restaurant_errors.dart';

class GetFavoriteRestaurantsUsecase {
  final FavoriteRestaurantRepository _repository =
      SFInjector.instance.get<FavoriteRestaurantRepository>();

  Future<Either<GetRestaurantError, List<Restaurant>>> execute() async {
    try {
      var restaurants = await _repository.getFavoriteRestaurants();
      return Right(restaurants);
    } catch (e) {
      return Left(GetRestaurantError(error: e.toString()));
    }
  }
}
