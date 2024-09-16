import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/ui/tokens/colors.dart';

class FavoriteBtnWidget extends StatefulWidget {
  final RestaurantEntity restaurant;
  FavoriteBtnWidget({super.key, required this.restaurant});

  @override
  State<FavoriteBtnWidget> createState() => _FavoriteBtnWidgetState();
}

class _FavoriteBtnWidgetState extends State<FavoriteBtnWidget> {
  late bool isFavoriteRestaurant = false;
  // isFavoriteRestaurant = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavoriteRestaurant = !isFavoriteRestaurant;
        });
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: isFavoriteRestaurant //
            ? const Icon(
                Icons.favorite,
                color: OsColors.secondaryColor,
              )
            : const Icon(
                Icons.favorite_outline,
                color: OsColors.secondaryColor,
              ),
      ),
    );
  }
}
