import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/restaurant_provider.dart';

import '../../../../models/restaurant.dart';

class RestaurantDetailsFavoriteButton extends ConsumerWidget {
  final Restaurant restaurant;

  const RestaurantDetailsFavoriteButton({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesListProvider);
    final isFavorite = favorites.any((r) => r.id == restaurant.id);
    return IconButton(
      onPressed: () {
        ref.read(favoritesListProvider.notifier).toggleFavorite(restaurant);
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
    );
  }
}
