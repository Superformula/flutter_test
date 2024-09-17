part of '../restaurant_tour_page.dart';

class _RestaurantItem extends StatelessWidget {
  final RestaurantEntity _restaurant;

  const _RestaurantItem(this._restaurant);

  void _onItemTapped(BuildContext context) {
    void onFavorite() {
      final cubit = context.read<CubitRestaurantTourPresenter>();
      if (_restaurant is FavoriteRestaurantEntity) {
        cubit.removeFavoriteRestaurant(_restaurant as FavoriteRestaurantEntity);
      } else {
        cubit.addFavoriteRestaurant(_restaurant);
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RestaurantDetailPage(
          restaurant: _restaurant,
          onFavorite: onFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onItemTapped(context),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000),
              offset: Offset(0, 1),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            _Image(_restaurant.photos.isEmpty ? '' : _restaurant.photos.first),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_restaurant.name, style: AppTextStyles.loraRegularTitle),
                  const SizedBox(height: 4),
                  Text(_restaurant.price, style: AppTextStyles.openRegularText),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stars(_restaurant.rating.round()),
                      Status(_restaurant.isOpen),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
