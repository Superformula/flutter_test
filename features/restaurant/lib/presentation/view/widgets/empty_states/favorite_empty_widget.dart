import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_kit/presentation/font_style/typography.dart';

class FavoritesEmpyWidget extends StatelessWidget {
  const FavoritesEmpyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "FavoriteRestaurantEmptyState",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const Text(
            "You have no one favorited restaurants",
            style: AppTextStyles.loraRegularTitle,
          ),
          const SizedBox(
            height: 16,
          ),
          Lottie.asset(
            'assets/animations/favorites_empty_state.json',
            package: 'restaurant',
            height: 150,
          )
        ],
      ),
    );
  }
}
