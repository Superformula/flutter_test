import 'package:restaurant_tour/data/restaurant_repository.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';

final class GetRestaurantReviewsUseCase {
  GetRestaurantReviewsUseCase({required this.repository});

  final RestaurantRepository repository;

  Future<List<RestaurantReviewData>> call({required String restaurantId}) async {
    return repository.getReviewsForRestaurant(restaurantId: restaurantId);
  }
}
