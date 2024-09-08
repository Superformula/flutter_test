import 'package:restaurant_tour/data/models/restaurant_data.dart';
import 'package:restaurant_tour/data/restaurant_repository.dart';

final class GetRestaurantReviewsUseCase {
  GetRestaurantReviewsUseCase({required this.repository});

  final RestaurantRepository repository;

  Future<List<RestaurantReviewData>> call({required String restaurantId}) async {
    return repository.getReviewsForRestaurant(restaurantId: restaurantId);
  }
}
