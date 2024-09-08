import 'package:restaurant_tour/data/models/restaurant_data.dart';
import 'package:restaurant_tour/data/restaurant_repository.dart';

final class ListRestaurantsUseCase {
  ListRestaurantsUseCase({required this.repository});

  final RestaurantRepository repository;

  Future<List<RestaurantData>> call({required int offset, int limit = 1}) async {
    return repository.getRestaurants(offset: offset, limit: limit);
  }
}
