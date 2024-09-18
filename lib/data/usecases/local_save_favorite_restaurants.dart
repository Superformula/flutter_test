import 'dart:convert';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../../infra/cache/cache.dart';
import '../models/models.dart';

class LocalSaveFavoriteRestaurants implements SaveFavoriteRestaurants {
  final SaveCache cache;

  LocalSaveFavoriteRestaurants({required this.cache});

  @override
  Future<void> call(List<RestaurantEntity> restaurants) async {
    try {
      final value = jsonEncode(restaurants.map((restaurant) => LocalRestaurantModel.fromEntity(restaurant).toJson()).toList());
      return await cache.save(key: 'favorite_restaurants', value: value);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
