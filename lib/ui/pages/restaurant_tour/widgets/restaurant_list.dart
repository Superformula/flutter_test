part of '../restaurant_tour_page.dart';

class _RestaurantList extends StatelessWidget {
  const _RestaurantList();

  @override
  Widget build(BuildContext context) {
    final restaurantList = context.read<CubitRestaurantTourPresenter>().restaurantList;
    if (restaurantList.isEmpty) {
      return const _MessageContent('No restaurants.');
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: restaurantList.length,
        itemBuilder: (context, index) {
          final restaurant = restaurantList[index];
          return _RestaurantItem(restaurant);
        },
        separatorBuilder: (_, __) => const SizedBox(height: 12),
      );
    }
  }
}
