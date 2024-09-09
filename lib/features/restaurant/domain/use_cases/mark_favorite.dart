import 'package:restaurant_tour/features/restaurant/domain/repositories/yelp_repository.dart';

class MarkFavorite {
  final YelpRepository repository;

  MarkFavorite(this.repository);

  Future<void> call(String id) async {
    await repository.markFavorite(id);
  }
}
