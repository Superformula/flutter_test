import 'dart:convert';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../infra/infra.dart';
import '../models/models.dart';

class LocalGetFavoriteRestaurants implements GetFavoriteRestaurants {
  final FetchCache cache;

  LocalGetFavoriteRestaurants({
    required this.cache,
  });

  @override
  Future<List<FavoriteRestaurantEntity>> call() async {
    try {
      final result = await cache.fetch('favorite_restaurants');
      if (result == null) return [];
      final jsonDecoded = jsonDecode(result);
      return (jsonDecoded as List).map((article) => RestaurantModel.fromJson(article).toFavoriteEntity()).toList();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
