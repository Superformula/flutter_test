import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../domain/entities/entities.dart';
import '../../widgets/widgets.dart';

part 'widgets/arrow_back_icon.dart';
part 'widgets/divider.dart';
part 'widgets/image.dart';
part 'widgets/favorite_icon.dart';
part 'widgets/rating.dart';
part 'widgets/review_item.dart';
part 'widgets/review_list.dart';

class RestaurantDetailPage extends StatelessWidget {
  final RestaurantEntity _restaurant;
  final VoidCallback _onFavorite;

  const RestaurantDetailPage({
    super.key,
    required RestaurantEntity restaurant,
    required VoidCallback onFavorite,
  })  : _restaurant = restaurant,
        _onFavorite = onFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const _ArrowBackIcon(),
        actions: [
          _FavoriteIcon(
            isFavorite: _restaurant is FavoriteRestaurantEntity,
            onFavorite: _onFavorite,
          ),
        ],
        title: Text(_restaurant.name, style: AppTextStyles.loraRegularHeadline),
      ),
      body: ListView(
        children: [
          _Image(photos: _restaurant.photos),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_restaurant.price, style: AppTextStyles.openRegularText),
                    Status(_restaurant.isOpen),
                  ],
                ),
                const _Divider(),
                const Text('Address', style: AppTextStyles.openRegularText),
                const SizedBox(height: 24),
                Text(_restaurant.address, style: AppTextStyles.openRegularTitleSemiBold),
                const _Divider(),
                const Text('Overall Rating', style: AppTextStyles.openRegularText),
                const SizedBox(height: 16),
                _Rating(_restaurant.rating.toString()),
                const _Divider(),
                _ReviewList(_restaurant.reviews),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
