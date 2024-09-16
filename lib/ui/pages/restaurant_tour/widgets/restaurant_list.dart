part of '../restaurant_tour_page.dart';

class _RestaurantList extends StatelessWidget {
  const _RestaurantList();

  @override
  Widget build(BuildContext context) {
    final restaurantList = context.read<CubitRestaurantTourPresenter>().restaurantList;
    if (restaurantList.isEmpty) {
      return const _MessageContent('No restaurants.');
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (itemBuilder, index) {
          final restaurant = restaurantList[index];
          return _RestaurantItem(restaurant);
        },
      );
    }
  }
}
