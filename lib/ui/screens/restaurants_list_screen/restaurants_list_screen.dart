import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prototype_constrained_box/prototype_constrained_box.dart';
import 'package:restaurant_tour/cubit.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/ui/colors.dart';
import 'package:restaurant_tour/ui/screens/restaurant_details_screen/restaurant_details_screen.dart';
import 'package:restaurant_tour/ui/typography.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_hour_status.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_image.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_price_and_category_info.dart';
import 'package:restaurant_tour/ui/widgets/restaurant_rating.dart';

import 'cubit.dart';
import 'state.dart';

final class RestaurantsListScreen extends StatefulWidget {
  const RestaurantsListScreen({super.key});

  @override
  State<RestaurantsListScreen> createState() => _RestaurantsListScreenState();
}

class _RestaurantsListScreenState extends State<RestaurantsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RestaurantsListScreenCubit>().loadRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantsListScreenCubit, RestaurantsListScreenState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('RestauranTour'),
              bottom: const TabBar(
                tabAlignment: TabAlignment.center,
                labelPadding: EdgeInsets.all(8.0),
                tabs: [
                  Text('All Restaurants'),
                  Text('My Favorites'),
                ],
              ),
            ),
            body: switch (state) {
              RestaurantsListLoading() => _LoadingRestaurants(),
              RestaurantsListData(:final restaurants) => _RestaurantsData(restaurants: restaurants),
              RestaurantsListError(:final exception) => Text('Error: $exception'),
            },
          ),
        );
      },
    );
  }
}

final class _LoadingRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

final class _RestaurantsData extends StatelessWidget {
  const _RestaurantsData({
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantTourCubit, Set<String>>(
      builder: (context, state) {
        final filteredRestaurants = [
          for (final restaurant in restaurants)
            if (state.contains(restaurant.id)) restaurant,
        ];

        return TabBarView(
          children: [
            _RestaurantsList(
              restaurants: restaurants,
              emptyState: const _RestaurantListEmptyState(),
            ),
            _RestaurantsList(
              restaurants: filteredRestaurants,
              emptyState: const _RestaurantFavoritesListEmptyState(),
            ),
          ],
        );
      },
    );
  }
}

final class _RestaurantsList extends StatelessWidget {
  const _RestaurantsList({
    required this.restaurants,
    required this.emptyState,
  });

  final List<Restaurant> restaurants;
  final Widget emptyState;

  @override
  Widget build(BuildContext context) {
    if (restaurants.isEmpty) {
      return emptyState;
    } else {
      // The figma specifies 12.0, but there's already a perceived padding from
      // the card, so we compensate it.
      const verticalPadding = 4.0;

      return ListView.separated(
        padding: EdgeInsets.fromLTRB(
          12.0,
          verticalPadding * 2.0,
          12.0,
          verticalPadding * 2.0 + MediaQuery.of(context).padding.bottom,
        ),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantCard(restaurant: restaurants[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: verticalPadding),
      );
    }
  }
}

final class _RestaurantListEmptyState extends StatelessWidget {
  const _RestaurantListEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.no_food,
            color: Colors.emptyStateColor,
            size: 128.0,
          ),
          const SizedBox(height: 8.0),
          const Text(
            'No restaurants were found.',
            style: AppTextStyles.loraHeading6,
          ),
          const SizedBox(height: 8.0),
          const Text(
            'You may try to reload the screen.',
            style: AppTextStyles.openCaption,
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () => context.read<RestaurantsListScreenCubit>().loadRestaurants(),
            child: const Text('Reload'),
          ),
        ],
      ),
    );
  }
}

final class _RestaurantFavoritesListEmptyState extends StatelessWidget {
  const _RestaurantFavoritesListEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.heart_broken_rounded,
            color: Colors.emptyStateColor,
            size: 128.0,
          ),
          const SizedBox(height: 8.0),
          const Text(
            'You have no favorite restaurants.',
            style: AppTextStyles.loraHeading6,
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Go back to the restaurants list and add one to your favorites!',
            style: AppTextStyles.openCaption,
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () => DefaultTabController.of(context).animateTo(0),
            child: const Text('See all restaurants'),
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
final class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RestaurantDetailsScreen(
                restaurant: restaurant,
                onFavorite: () => context.read<RestaurantTourCubit>().toggleFavorite(restaurant.id),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 88.0,
                child: RestaurantImage(
                  heroTag: restaurant.id,
                  restaurant: restaurant,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PrototypeConstrainedBox.tightFor(
                      height: true,
                      prototype: const Text(
                        'First line\nSecond line',
                        style: AppTextStyles.loraSubtitle1,
                      ),
                      child: Text(
                        restaurant.name,
                        style: AppTextStyles.loraSubtitle1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    RestaurantPriceAndCategoryInfo(restaurant: restaurant),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        RestaurantRating(restaurant: restaurant),
                        const Spacer(),
                        RestaurantHourStatus(restaurant: restaurant),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
