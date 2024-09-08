import 'package:restaurant_tour/data/restaurant_repository.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';

final class ListRestaurantsUseCase {
  ListRestaurantsUseCase({required this.repository});

  final RestaurantRepository repository;

  Future<List<RestaurantData>> call({required int offset, int limit = 20}) async {
    return repository.getRestaurants(offset: offset, limit: limit);
  }
}
