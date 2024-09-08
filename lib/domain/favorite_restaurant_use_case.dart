import 'package:restaurant_tour/data/models/restaurant_data.dart';
import 'package:restaurant_tour/data/restaurant_repository.dart';

final class FavoritesRestaurantsUseCase {
  FavoritesRestaurantsUseCase({required this.repository});

  final RestaurantRepository repository;

  List<RestaurantData> get favorites => repository.favorites;

  Future<void> call({required int offset, required String restaurantId, bool isFavorite = false}) async {
    return repository.favoritate(restaurantId: restaurantId, offset: offset, isFavorite: isFavorite);
  }
}
