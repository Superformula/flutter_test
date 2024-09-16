part of '../restaurant_tour_page.dart';

class _FavoriteRestaurantList extends StatelessWidget {
  const _FavoriteRestaurantList();

  @override
  Widget build(BuildContext context) {
    final favoriteRestaurantList = context.read<CubitRestaurantTourPresenter>().favoriteRestaurantList;
    if (favoriteRestaurantList.isEmpty) {
      return const _MessageContent('No favorites.');
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (itemBuilder, index) {
          final restaurant = favoriteRestaurantList[index];
          return _RestaurantItem(restaurant);
        },
      );
    }
  }
}
