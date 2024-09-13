import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_detail/restaurant_detail.dart';

class RestaurantDetailContent extends StatelessWidget {
  const RestaurantDetailContent({required this.restaurant, super.key});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(restaurant.name ?? ''),
            backgroundColor: Colors.white,
            floating: false,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                context.pop();
              },
            ),
            actions: [
              FavoriteButtonWidget(restaurant: restaurant),
              const SizedBox(
                width: 14,
              ),
            ],
          ),
          RestaurantInformationWidget(restaurant: restaurant),
          ReviewListWidget(
            restaurant: restaurant,
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 24,
            ),
            sliver: const SliverToBoxAdapter(
              child: SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
